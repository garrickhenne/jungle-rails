require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    
    it 'should require name' do
      @category = Category.find_or_create_by! name: 'Evergreens'
      @product = @category.products.new({ description: 'description', quantity: 1, price: 22.99, name: nil })

      expect { @product.save! }.to raise_error(/Name can't be blank/)
    end
    
    it 'should require price' do
      @category = Category.find_or_create_by! name: 'Evergreens'
      @product = @category.products.new({ name: 'product name', description: 'description', quantity: 1, price_cents: nil })

      expect { @product.save! }.to raise_error(/Price can't be blank/)
    end
    
    it 'should require quantity' do
      @category = Category.find_or_create_by! name: 'Evergreens'
      @product = @category.products.new({ name: 'product name', description: 'description', price: 22.99, quantity: nil })

      expect { @product.save! }.to raise_error(/Quantity can't be blank/)
    end
    
    it 'should require category' do
      @product = Product.new({ name: 'product name', description: 'description', quantity: 1, price: 22.99, category_id: nil })

      expect { @product.save! }.to raise_error(/Category can't be blank/)
    end

    it 'should require a valid present category' do
      @product = Product.new({ name: 'product name', description: 'description', quantity: 1, price: 22.99, category_id: 99 })

      expect { @product.save! }.to raise_error(/Category must exist/)
    end
    
    it 'should create a product when all required attributes are included' do
      @category = Category.find_or_create_by! name: 'Evergreens'
      @product = @category.products.create!({ name: 'Product1', description: 'Product1 description', quantity: 1, price: 24.99 })
      
      expect(@product.id).to be_present
    end
  end
end