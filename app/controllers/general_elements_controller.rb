class GeneralElementsController < ApplicationController
  autocomplete :taxo_nationality, :nationality

  def show
    @general_element=GeneralElement.find(params[:id])
  end

  def new
    @general_element=GeneralElement.new
    #debugger
  end

  def create
    @term_nat=TaxoNationality.find_by_nationality(params[:general_element][:taxo_nationality])
    #debugger
    if !@term_nat.blank?
      @id=@term_nat.id
      @general_element=GeneralElement.new("taxo_nationality_id"=>@id, "taxo_gender_id"=>params[:general_element][:taxo_gender_id])
      if @general_element.save
        flash[:success]="General element created"
        redirect_to @general_element
      else
        render 'new'
      end
    else
      flash.now[:error]='Please select a valid Country'
      @general_element=GeneralElement.new
      @general_element.gender=params[:general_element][:taxo_gender_id]
      render 'new'
    end
    
  end


  def index
    
  end
end
