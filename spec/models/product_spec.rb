require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    #validations/tests here
    it 'validates that there is a name' do
      cat1 = Category.find_or_create_by! name: 'Apparel'
      product = cat1.products.create({
        name:  nil,
        description: "Faker::Hipster.paragraph(4)",
        image: 'image',
        quantity: 10,
        price: 64.99
      })
      expect(product.name).to be(nil)
    end

    it 'validates that there is a price' do
      cat1 = Category.find_or_create_by! name: 'Apparel'
      product = cat1.products.create({
        name:  'name',
        description: "Faker::Hipster.paragraph(4)",
        image: 'image',
        quantity: 10,
        price_cents: nil
      })
      expect(product).to be_invalid
    end

    it 'validates that there is a quantity' do
      cat1 = Category.find_or_create_by! name: 'Apparel'
      product = cat1.products.create({
        name:  'name',
        description: "Faker::Hipster.paragraph(4)",
        image: 'image',
        quantity: nil,
        price: 64.99
      })
      expect(product).to be_invalid
    end

    it 'validates that there is no category' do
      
      product = Product.create({
        name:  'name',
        description: "Faker::Hipster.paragraph(4)",
        image: 'image',
        quantity: 10,
        price: 64.99
      
      })
      puts product.errors.full_messages
      expect(product).to be_invalid
    end

  end
end
