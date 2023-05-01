class HomeownerInsurance < ApplicationRecord
  validates_presence_of %i[
    first_name last_name email phone address zip city province assessment
    language homeowner_name_1 type_of_property purchase_date lot_numbers
    property_address property_city property_zip
  ]

  validates :bound_by_water, inclusion: { in: [true, false] }
  validates :on_municipal_water, inclusion: { in: [true, false] }
  validates :title_insurance_already_issued, inclusion: { in: [true, false] }
  validates :denied_for_insurance, inclusion: { in: [true, false] }

  enum language: %i[french english]
  enum type_of_property: [
    'Single-family Dwelling',
    'Condominium',
    'Undivided Co-ownership',
    'Duplex',
    'Triplex',
    'Quadruplex',
    '5 Units',
    '6 Units',
    'Vacant property (no building)'
  ]

  def name
    "#{first_name} #{last_name}"
  end
end
