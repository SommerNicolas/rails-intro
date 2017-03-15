require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test 'T-shirt has a price' do
    product = Product.find_by(title: 'T-shirt')
    assert 0 < product.price
  end

  test 'with a title, description and price' do
    prod = Product.create(title: 'Title', description: 'Lorem', price: 0.1 + 0.2)

    assert prod.valid?
    assert prod.id
    assert 'Title' == prod.title
    assert 'Lorem' == prod.description
    assert 0.3 == prod.price
  end

  test 'must have a title' do
    assert_not Product.create(price: 10).valid?
  end

  test 'must have a price greater than zero' do
    assert_raise do
      Product.create!(title: 'Untitled', price: 0)
    end
  end
end
