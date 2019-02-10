require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'validations' do
    it 'requires a title' do
      book = Book.new(title: '')
      book.valid?
      expect(book.errors[:title]).to include("can't be blank")
    end

    it 'requires an author' do
      book = Book.new
      book.valid?
      expect(book.errors[:authors]).to include("can't be blank")
    end

    it 'requires a release date' do
      book = Book.new
      book.valid?
      expect(book.errors[:release_date]).to include("can't be blank")
    end

    it 'requires a format' do
      book = Book.new
      book.valid?
      expect(book.errors[:format]).to include("must exist")      
    end

    it 'requires a base price if release date is within 2 months from now' do
      book = Book.new(title: 'Fake title', release_date: DateTime.now + 1.month)
      book.authors << Author.first
      book.valid?
      expect(book.errors[:base_price]).to include("required if release date is within 2 months")
    end

    it 'does not require a base price if release date is more than 2 months from now' do
      book = Book.new(title: 'Fake title', release_date: DateTime.now + 3.month)
      book.authors << Author.first
      book.valid?
      expect(book.errors[:base_price]).to be_empty
    end

    it 'does not require a base price if release date is in the past' do
      book = Book.new(title: 'Fake title', release_date: DateTime.now - 1.month)
      book.authors << Author.first
      book.valid?
      expect(book.errors[:base_price]).to be_empty
    end

  end
end
