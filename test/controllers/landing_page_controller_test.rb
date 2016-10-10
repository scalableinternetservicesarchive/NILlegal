require 'test_helper'

class LandingPageControllerTest < ActionDispatch::IntegrationTest
  
  test 'should get welcome' do
    get '/'
    assert_response :success
  end
end
