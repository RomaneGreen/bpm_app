class Book < ApplicationRecord
  belongs_to :format
  has_and_belongs_to_many :authors
  validates_presence_of :title, :release_date, :authors
  validate :base_price_based_on_release_date

  scope :published_2018, -> { 
    where('release_date > ?', DateTime.new(2017, 12, 31))
    .where('release_date < ?', DateTime.new(2018, 12, 31))
  }
  scope :by_format, -> (format) { where(format_id: format.id) }

  protected

  def base_price_based_on_release_date
    unless release_date.nil?
      two_months_from_now = DateTime.now + 2.month
      if base_price.nil? && release_date <= two_months_from_now && release_date > DateTime.now
        errors.add(:base_price, 'required if release date is within 2 months')
      end
    end
  end
end
