class InsuranceQuoteCalculatorService
  EMISION_FEE = BigDecimal('20', 10)
  TAX = BigDecimal('0.09', 10)

  def initialize(insurance_quote)
    @insurance_quote = insurance_quote
  end

  def process
    (premium_before_taxes + taxes + EMISION_FEE).round(2)
  end

  private

  def premium_before_taxes
    # rubocop:disable Metrics/LineLength
    ((@insurance_quote.assessment - BigDecimal('500000', 10)) / BigDecimal('1000', 10) * BigDecimal('1.17', 10)) + BigDecimal('320', 10)
    # rubocop:enable Metrics/LineLength
  end

  def taxes
    premium_before_taxes * TAX
  end
end
