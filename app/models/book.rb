class Book < ApplicationRecord
    belongs_to :format
    has_and_belongs_to_many :authors
    validates_presence_of :title, :release_date
end
