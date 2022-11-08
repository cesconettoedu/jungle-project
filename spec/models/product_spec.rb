require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    
    context "given valid attributes" do
      
      it "returns valid products when all the params are given" do
        @category = Category.new(name: "Tree")
        @product = Product.new(
        name: 'Flower',
        price_cents: 100,
        quantity: 2,
        category: @category
        )
        expect(@product).to be_valid
      end

      it "returns invalid product when miss name" do
        @category = Category.new(name: "Tree")
        @product = Product.new(
        name: nil,
        price_cents: 100,
        quantity: 2,
        category: @category
        )
        expect(@product).to_not be_valid
      end

      it "returns invalid product when miss price" do
        @category = Category.new(name: "Tree")
        @product = Product.new(
        name: 'Flower',
        price_cents: nil,
        quantity: 2,
        category: @category
        )
        expect(@product).to_not be_valid
      end
      
      it "returns invalid product when miss quantity" do
        @category = Category.new(name: "Tree")
        @product = Product.new(
        name: 'Flower',
        price_cents: 100,
        quantity: nil,
        category: @category
        )
        expect(@product).to_not be_valid
      end

      it "returns invalid product when miss category" do
        @category = Category.new(name: "Tree")
        @product = Product.new(
        name: 'Flower',
        price_cents: 100,
        quantity: 2,
        category: nil
        )
        expect(@product).to_not be_valid
      end

    end
  end
end
