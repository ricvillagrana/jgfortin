require 'test_helper'

class HomeownerInsurancesControllerTest < ActionDispatch::IntegrationTest
  fixtures :homeowner_insurances

  test 'GET #index should all the homeowner insurances' do
    get root_path

    assert_response :success
  end

  test 'GET #new should render the new homeowner insurance form' do
    get new_homeowner_insurance_path

    assert_response :success
  end

  test 'POST #create should create a new homeowner insurance' do
    params = homeowner_insurances(:john).attributes.except('id', 'created_at', 'updated_at')

    homeowner_insurance_params = {
      homeowner_insurance: params
    }

    assert_changes 'HomeownerInsurance.count' do
      post homeowner_insurances_path, params: homeowner_insurance_params
    end

    assert_redirected_to homeowner_insurance_path(HomeownerInsurance.last)
  end

  test 'GET #show should show a homeowner insurance' do
    homeowner_insurance = homeowner_insurances(:john)

    get homeowner_insurance_path(homeowner_insurance)

    assert_response :success
  end
end
