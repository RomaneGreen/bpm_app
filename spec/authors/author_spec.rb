require 'rails_helper'

RSpec.describe Author, type: :model do
  describe 'validations' do
    it 'requires name to be unique' do
      author1 = Author.new(name: 'Taken')
      author2 = Author.new(name: 'Taken')
      author1.save!
      author2.valid?
      expect(author2.errors[:name]).to include("has already been taken")
    end
  end
end
