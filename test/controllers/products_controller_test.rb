require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  test 'should get products on /' do
    get '/'
    # or:
    #get root_url

    assert_response :success
    assert_not_nil assigns(:products)
  end
end
