class AddHotelReferenceToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :hotel_id, :integer
  end
end
