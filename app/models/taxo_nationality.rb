class TaxoNationality < ActiveRecord::Base
  attr_accessible :nationality
  
  has_many :general_element
end
