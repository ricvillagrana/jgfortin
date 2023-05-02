class HomeownerInsurancesController < ApplicationController
  before_action :set_quote_fields, only: %i[new create]

  def index
    @insurances = HomeownerInsurance.all
  end

  def new
    @insurance = HomeownerInsurance.new
  end

  def quote
    @insurance = HomeownerInsurance.new(insurance_params)
    @insurance_total = InsuranceQuoteCalculatorService.new(@insurance).process

    populate_insurance_fields
  end

  def create
    @insurance = HomeownerInsurance.new(insurance_params)
    @insurance_total = InsuranceQuoteCalculatorService.new(@insurance).process

    if @insurance.save
      redirect_to homeowner_insurance_path(@insurance)
    else
      render :quote
    end
  end

  def show
    @insurance = HomeownerInsurance.find(params[:id])
    @insurance_total = InsuranceQuoteCalculatorService.new(@insurance).process
  end

  private

  def populate_insurance_fields
    @insurance.homeowner_name_1 = @insurance.name
    @insurance.property_address = @insurance.address
    @insurance.property_city = @insurance.city
    @insurance.property_zip = @insurance.zip
  end

  def insurance_params
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
