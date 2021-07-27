require 'rails_helper'

RSpec.describe Product, type: :model do
  test_category = Category.new(name: "Product test category")
  subject do
    described_class.new(
      name:        "Product test name",
      price_cents: 123,
      quantity:    999999,
      category:    test_category
    )
  end

  describe 'Validations' do
    it "valid with valid values" do
      expect(subject).to be_valid
    end

    it "name is required" do
      subject.name = nil
      expect(subject).to be_invalid
      expect(subject.errors.full_messages).to include("Name can't be blank")
    end

    it "price is required" do
      subject.price_cents = nil
      expect(subject).to be_invalid
      expect(subject.errors.full_messages).to include("Price can't be blank")
    end
      it "quantity is required" do
        subject.quantity = nil
        expect(subject).to be_invalid
        expect(subject.errors.full_messages).to include("Quantity can't be blank")
    end
  
    it "category is required" do
      subject.category = nil
      expect(subject).to be_invalid
      expect(subject.errors.full_messages).to include("Category can't be blank")
    end
  end
end
