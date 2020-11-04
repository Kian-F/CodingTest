class PeopleController < ApplicationController
  

  def index
    @people = Person.page(params[:page])
    # render :json => @people
  end
 

  def import
    Person.my_import(params[:file])
    #Location.my_import(params[:file])
    redirect_to root_url, notice: "Successfuly Imported Data!"
  end

  def search
    
    # if params[:q].blank?  
    #   redirect_to(search_url, alert: "Empty field!") and return  
     @people = Person.where("name LIKE? OR location LIKE? OR species LIKE? OR gender LIKE? OR affiliations LIKE? OR weapon LIKE? OR vehicle LIKE? ","%"  + params[:q].downcase + "%","%"  + params[:q].downcase + "%","%"  + params[:q].downcase + "%","%"  + params[:q].downcase + "%","%"  + params[:q].downcase + "%","%"  + params[:q].downcase + "%","%"  + params[:q].downcase + "%").page(params[:page])
     
   end
 end
