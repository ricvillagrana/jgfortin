class InsuranceQuoteCalculatorService
  EMISION_FEE = 20
  TAX = 0.09

  def initialize(insurance_quote)
    @insurance_quote = insurance_quote
  end

  def process
    premium_before_taxes + taxes + EMISION_FEE
  end

  private

  def premium_before_taxes
    ((@insurance_quote.assessment - 500_000) / 1000 * 1.17) + 320
  end

  def taxes
    premium_before_taxes * TAX
  end
end
