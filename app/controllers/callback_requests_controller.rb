class CallbackRequestsController < ApplicationController
  before_action :set_insurance, only: %i[new create]

  def new
    @callback_request = CallbackRequest.new(homeowner_insurance: @insurance)
  end

  def create
    @callback_request = CallbackRequest.new(
      callback_request_params.merge(homeowner_insurance: @insurance)
    )

    if @callback_request.save
      redirect_to homeowner_insurance_callback_request_path(@insurance, @callback_request)
    else
      render :new
    end
  end

  def show
    @callback_request = CallbackRequest.find(params[:id])
  end

  private

  def callback_request_params
    params
      .require(:callback_request)
      .permit(
        %w[
          phone best_moment reason_has_questions reason_prefer_to_complete_by_phone
          reason_other
        ]
      )
  end

  def set_insurance
    @insurance = HomeownerInsurance.find(params[:homeowner_insurance_id])
  end
end
