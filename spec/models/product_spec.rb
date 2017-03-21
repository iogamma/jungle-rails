require 'rails_helper'

RSpec.describe Product, type: :model do

  let(:category) { Category.new(name: "toy") }
  let(:product) { Product.new(
                    name: "bunnies",
                    price: 2345,
                    quantity: 2,
                    category: category) }

  describe 'Validations' do

    it 'there should be no errors for a product with all attributes present' do
      product.save!
      expect(product).to be_valid
    end

    it 'matches the cannot be blank error message for for empty product name' do
      product.name = nil
      product.save
      expect(product.errors.full_messages).to include("Name can't be blank")
    end

    it 'matches the cannot be blank error message for for empty product quantity' do
      product.price_cents = nil
      product.save
      expect(product.errors.full_messages).to include("Price can't be blank")
    end

    it 'matches the cannot be blank error message for for empty product price' do
      product.quantity = nil
      product.save
      expect(product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'matches the cannot be blank error message for for empty product category' do
      product.category= nil
      product.save
      expect(product.errors.full_messages).to include("Category can't be blank")
    end
  end

end
