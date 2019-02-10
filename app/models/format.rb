class Format < ApplicationRecord
  has_one :book
  validates_uniqueness_of :name
  validate :correct_name

  protected

  def correct_name
    unless ['Digital', 'Hardcover', 'Softcover'].include? name
      errors.add(:name, 'invalid - must be Digital, Hardcover, or Softcover')
    end
  end

end
