class AddLikesToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :likes, :integer
  end
end
