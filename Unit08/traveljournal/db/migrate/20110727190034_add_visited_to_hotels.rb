class AddVisitedToHotels < ActiveRecord::Migration
  def change
    add_column :hotels, :visited, :boolean
  end
end
