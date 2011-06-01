class Trip < ActiveRecord::Base
  validates :name, :presence => true
  belongs_to :hotel
end
