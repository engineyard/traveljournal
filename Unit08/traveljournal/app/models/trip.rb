class Trip < ActiveRecord::Base
  validates :name, :presence => true
  validates_length_of :name, :minimum => 2
  validates_presence_of :hotel

  belongs_to :hotel
end
