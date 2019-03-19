require 'test_helper'

class InformationErrorControllerTest < ActionDispatch::IntegrationTest
  test "should get generate_pdf" do
    get information_error_generate_pdf_url
    assert_response :success
  end

end
