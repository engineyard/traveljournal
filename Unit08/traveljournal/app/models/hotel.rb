class Hotel < ActiveRecord::Base
  validates :name, :presence => true
  validates_length_of :name, :minimum => 2
  validates_presence_of :city

  before_save :ensure_name_is_in_titlecase

  belongs_to :city
  has_many :trips

  def self.yet_to_visit
    where(:visited => false)
  end

  protected

  def ensure_name_is_in_titlecase
    self.name = self.name.titlecase
  end
end
