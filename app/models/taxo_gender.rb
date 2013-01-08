class TaxoGender < ActiveRecord::Base
  attr_accessible :gender

  has_many :general_elements
end
