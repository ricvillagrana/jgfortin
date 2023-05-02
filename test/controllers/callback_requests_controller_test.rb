require 'test_helper'

class CallbackRequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @insurance = homeowner_insurances(:john)
  end

  test 'GET #new should render the new callback request form' do
    get new_homeowner_insurance_callback_request_path(@insurance)

    assert_response :success
  end

  test 'POST #create should create a new callback request' do
    params = callback_requests(:john).attributes.except('id', 'created_at', 'updated_at')

    assert_changes 'CallbackRequest.count' do
      post homeowner_insurance_callback_requests_path(@insurance), params: {
        callback_request: params
      }
    end

    assert_redirected_to homeowner_insurance_callback_request_path(@insurance, CallbackRequest.last)
  end

  test 'GET #show should show a callback request' do
    callback_request = callback_requests(:john)

    get homeowner_insurance_callback_request_path(@insurance, callback_request)

    assert_response :success
  end
end
