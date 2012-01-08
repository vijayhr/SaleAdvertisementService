class ItemsController < ApplicationController
  before_filter :authenticate_user!, :only => [:new, :create]

  def index
    @items = Item.order('created_at desc').group_by {|item|
        item.created_at.strftime("%d-%m-%Y")
      }.sort

      respond_to do |format|
        if @items.empty?
          format.html {render :action => :index , :notice => 'No Records.' }
        else
          format.html # index.html.erb
        end
      end
  end

  def show
    @item = Item.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def new
    @item = Item.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def create
    @item = Item.new(params[:item])

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, :notice => 'Item was successfully created.' }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def search_by_title
    @items = Item.search do
      fulltext params[:search]
      order_by :created_at, :asc
    end.results.group_by {|item| item.created_at.strftime("%d-%m-%Y")}.sort

    respond_to do |format|
      if @items.empty?
        format.html {render :action => :index, :layout => false, :notice => 'No Records.' }
      else
        format.html {render :action => :index, :layout => false}
      end
    end

  end
end
