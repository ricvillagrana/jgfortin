require 'test_helper'

class HomeownerInsuranceTest < ActiveSupport::TestCase
  fixtures :homeowner_insurances

  test 'should not save homeowner insurance without the required fields' do
    homeowner_insurance = HomeownerInsurance.new

    assert_no_changes 'HomeownerInsurance.count' do
      homeowner_insurance.save
    end
  end

  test 'should save homeowner insurance with the required fields' do
    attributes = homeowner_insurances(:john).attributes.except('id', 'created_at', 'updated_at')
    homeowner_insurance = HomeownerInsurance.new(attributes)

    assert_changes 'HomeownerInsurance.count' do
      homeowner_insurance.save
    end
  end

  test 'should save homeowner insurance with valid language' do
    homeowner_insurance = homeowner_insurances(:jane)

    assert_changes -> { homeowner_insurance.reload.language } do
      homeowner_insurance.update(language: :english)
    end
  end

  test 'should save homeowner insurance with valid type of property' do
    homeowner_insurance = homeowner_insurances(:jane)

    assert_changes -> { homeowner_insurance.reload.type_of_property } do
      homeowner_insurance.update(type_of_property: 'Duplex')
    end
  end

  test 'should not save homeowner insurance with invalid enum values' do
    homeowner_insurance = homeowner_insurances(:jane)

    assert_no_changes -> { homeowner_insurance.reload.language } do
      assert_raises(ArgumentError) do
        homeowner_insurance.update(language: :klingon)
      end
    end
  end

  test 'should not save homeowner insurance with invalid type of property' do
    homeowner_insurance = homeowner_insurances(:jane)

    assert_no_changes -> { homeowner_insurance.reload.type_of_property } do
      assert_raises(ArgumentError) do
        homeowner_insurance.update(type_of_property: :penthouse)
      end
    end
  end
end
