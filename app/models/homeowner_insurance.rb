class HomeownerInsurance < ApplicationRecord
  # validate presence of many fields
  validates_presence_of %i[
    first_name last_name email phone address zip city province assessment
    language homeowner_name_1 type_of_property purchase_date lot_numbers
    property_address property_city property_zip
  ]

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
end
