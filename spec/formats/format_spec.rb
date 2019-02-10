require 'rails_helper'

RSpec.describe Format, type: :model do
  describe 'validations' do
    it 'requires name to be Digital, Hardcover, or Softcover' do
      format = Format.new(name: 'Foo')
      format.valid?
      expect(format.errors[:name]).to include("invalid - must be Digital, Hardcover, or Softcover")
    end

    it 'requires name to be unique' do
      format = Format.new(name: 'Digital')
      format.valid?
      expect(format.errors[:name]).to include("has already been taken")
    end

  end
end
