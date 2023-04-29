class HomeownerInsurancesController < ApplicationController
  before_action :set_quote_fields, only: %i[new create]

  def index
    @insurances = HomeownerInsurance.all
  end

  def new
    @insurance = HomeownerInsurance.new
  end

  def new_from_quote
    @insurance = HomeownerInsurance.new(homeowner_insurance_params)
    @insurance_total = InsuranceQuoteCalculatorService.new(@insurance).process
  end

  def create
    @insurance = HomeownerInsurance.new(homeowner_insurance_params)

    if @insurance.save
      redirect_to homeowner_insurance_path(@insurance)
    else
      render :new
    end
  end

  def show
    @insurance = HomeownerInsurance.find(params[:id])
  end

  private

  def homeowner_insurance_params
    params
      .require(:homeowner_insurance)
      .permit(
        %w[
          first_name last_name email phone address zip city province assessment
          brokerage_fees language homeowner_name_1 homeowner_name_2 homeowner_name_3
          type_of_property existing_homeowner purchase_date lot_numbers
          property_address property_city property_zip bound_by_water
          on_municipal_water title_insurance_already_issued denied_for_insurance
          notes referral_agent_name referral_agent_email
        ]
      )
  end

  def set_quote_fields
    @quote_fields = %w[
      first_name last_name email phone address zip city province assessment
      brokerage_fees
    ]
  end
end
