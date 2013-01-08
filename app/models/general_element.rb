class GeneralElement < ActiveRecord::Base
  attr_accessible :feedback_filled_id, :taxo_gender_id, :taxo_nationality_id#,:taxo_nationality, :new_taxo_nationality_name
  belongs_to :feedback_filled
  belongs_to :taxo_nationality
  belongs_to :taxo_gender
  #attr_accessor :new_taxo_nationality_name
  #before_save :create_taxo_nationality_name

  #def create_taxo_nationality_name
    #create_taxo_nationality(:nationality => new_taxo_nationality_name) unless new_taxo_nationality_name.blank?
  #end

end
