class CreateItems < ActiveRecord::Migration
  def up
    create_table :items do |t|
      t.string :title
      t.text :description
      t.decimal :price

      t.timestamps
    end
  end

  def down
    drop_table :items
  end
end
