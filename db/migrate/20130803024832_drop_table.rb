class DropTable < ActiveRecord::Migration
  def up
  	drop_table :companies
  end

  def down
  	create_table :companies do |t|
      t.string :name
      t.string :url
      t.string :fbid
      t.string :desc
      t.integer :likes
      
      t.timestamps
    end  
      
  end
end
