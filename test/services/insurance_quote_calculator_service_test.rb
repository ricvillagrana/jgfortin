require "test_helper"

class InsuranceQuoteCalculatorServiceTest < ActiveSupport::TestCase
  fixtures :homeowner_insurances

  setup do
    @insurance = homeowner_insurances(:john)
    @insurance.update(
      assessment: 500_000
    )
  end

  test 'should calculate the insurance quote for 500_000 as 368.8' do
    insurance_quote = InsuranceQuoteCalculatorService.new(@insurance).process

    assert_equal 368.8, insurance_quote
  end

  test 'should calculate the insurance quote for 500_100 as 368.93' do
    @insurance.update(
      assessment: 500_100
    )

    insurance_quote = InsuranceQuoteCalculatorService.new(@insurance).process

    assert_equal 368.93, insurance_quote
  end

  test 'should calculate the insurance quote for 505_000 as 375.18' do
    @insurance.update(
      assessment: 505_000
    )

    insurance_quote = InsuranceQuoteCalculatorService.new(@insurance).process

    assert_equal 375.18, insurance_quote
  end

  test 'should calculate the insurance quote for 750_000 as 687.63' do
    @insurance.update(
      assessment: 750_000
    )

    insurance_quote = InsuranceQuoteCalculatorService.new(@insurance).process

    assert_equal 687.63, insurance_quote
  end

  test 'should calculate the insurance quote for 750_500 as 688.26' do
    @insurance.update(
      assessment: 750_500
    )

    insurance_quote = InsuranceQuoteCalculatorService.new(@insurance).process

    assert_equal 688.26, insurance_quote
  end
end
