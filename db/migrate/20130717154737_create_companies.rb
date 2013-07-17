class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :url
      t.string :fbid
      t.string :desc

      t.timestamps
    end
  end
end
