require "test_helper"

class CallbackRequestTest < ActiveSupport::TestCase
  fixtures :callback_requests

  setup do
    @insurance = homeowner_insurances(:john)
  end

  test 'should not save callback request without phone' do
    callback_request = CallbackRequest.new(
      homeowner_insurance: @insurance,
      best_moment: 'AM'
    )

    assert_no_changes 'CallbackRequest.count' do
      callback_request.save
    end
  end

  test 'should not save callback request without homeowner insurance' do
    callback_request = CallbackRequest.new(
      phone: '1234567890',
      best_moment: 'AM'
    )

    assert_no_changes 'CallbackRequest.count' do
      callback_request.save
    end
  end

  test 'should save callback request with phone, best moment and homeowner insurance' do
    callback_request = CallbackRequest.new(
      homeowner_insurance: @insurance,
      phone: '1234567890',
      best_moment: 'AM'
    )

    assert_changes 'CallbackRequest.count' do
      callback_request.save
    end
  end

  test 'should raise ArgumentError with invalid best moment' do
    assert_raises ArgumentError do
      CallbackRequest.new(
        homeowner_insurance: @insurance,
        phone: '1234567890',
        best_moment: 'invalid'
      )
    end
  end
end
