require 'test_helper'

class ProgrammingErrorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @programming_error = programming_errors(:one)
  end

  test "should get index" do
    get programming_errors_url
    assert_response :success
  end

  test "should get new" do
    get new_error_url
    assert_response :success
  end

  test "should create error" do
    assert_difference('ProgrammingError.count') do
      post errors_url, params: { programming_error: { cause: @programming_error.cause, code: @programming_error.code, message: @programming_error.message, reference: @programming_error.reference, solution: @programming_error.solution, users_id: @programming_error.users_id } }
    end

    assert_redirected_to programming_error_url(ProgrammingError.last)
  end

  test "should show error" do
    get error_url(@programming_error)
    assert_response :success
  end

  test "should get edit" do
    get edit_programming_error_url(@programming_error)
    assert_response :success
  end

  test "should update error" do
    patch programming_error_url(@programming_error), params: { programming_error: { cause: @programming_error.cause, code: @programming_error.code, message: @programming_error.message, reference: @programming_error.reference, solution: @programming_error.solution, users_id: @programming_error.users_id } }
    assert_redirected_to programming_error_url(@programming_error)
  end

  test "should destroy error" do
    assert_difference('ProgrammingError.count', -1) do
      delete programming_error_url(@programming_error)
    end

    assert_redirected_to programming_errors_url
  end
end
