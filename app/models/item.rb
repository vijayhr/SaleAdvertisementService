class Item < ActiveRecord::Base
  validates :title, :description, :presence => true
  
  searchable do
    text :title, :boost => 5
    time :created_at
  end
end
