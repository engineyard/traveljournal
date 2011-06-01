class Hotel < ActiveRecord::Base
  validates :name, :presence => true
  validates_length_of :name, :minimum => 2
  before_save :ensure_name_is_in_titlecase

  def ensure_name_is_in_titlecase
    self.name = self.name.titlecase
  end
end
