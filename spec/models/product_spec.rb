require 'rails_helper'

RSpec.describe Product, type: :model do

  before(:each) do
    @category = Category.new(name: "toy")
    @product = Product.new(name: "bunnies", price_cents: 2345, quantity: 2, category: @category)
  end
	

  describe 'Validations' do

    it 'there should be no errors for a product with all attributes present' do
      @product.save!
      expect(@product).to be_valid
    end

    it 'should fail for for empty product name' do
      @product.name = nil 
      expect{@product.save!}.to raise_error(ActiveRecord::RecordInvalid)
      error_blank = @product.errors.full_messages.include?("Name can't be blank")
      expect(error_blank).to be true 
    end

    it 'should fail for for empty product price' do
      @product.price_cents = nil 
      expect{ @product.save! }.to raise_error(ActiveRecord::RecordInvalid) 
byebug
      error_blank = @product.errors.full_messages.include?("Price can't be blank")
      expect(error_blank).to be true 
    end

    it 'should fail for for empty product quantity' do
      @product.quantity = nil 
      expect{ @product.save! }.to raise_error(ActiveRecord::RecordInvalid) 
      error_blank = @product.errors.full_messages.include?("Quantity can't be blank")
      expect(error_blank).to be true 
    end

    it 'should fail for for empty product name' do
      @product.category= nil 
      expect{ @product.save! }.to raise_error(ActiveRecord::RecordInvalid) 
      error_blank = @product.errors.full_messages.include?("Category can't be blank")
      expect(error_blank).to be true
    end
  end
end
