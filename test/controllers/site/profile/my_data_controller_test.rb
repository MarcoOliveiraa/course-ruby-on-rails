require 'test_helper'

class Site::Profile::MyDataControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get site_profile_my_data_index_url
    assert_response :success
  end

end
