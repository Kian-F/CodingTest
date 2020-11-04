class PeopleController < ApplicationController
  

  def index
    @people = Person.page(params[:page]).order(params[:sort])
    # render :json => @people
  end
 

  def import
    Person.my_import(params[:file])
    #Location.my_import(params[:file])
    redirect_to root_url, notice: "Successfuly Imported Data!"
  end

  def search
    
    # if params[:q].blank?  
    #   redirect_to(search_path, alert: "Empty field!") and return  
    
    @people = Person.where("name LIKE? OR location LIKE? OR species LIKE? OR gender LIKE? OR affiliations LIKE? OR weapon LIKE? OR vehicle LIKE? ","%"  + params[:q].to_s.downcase + "%","%"  + params[:q].to_s.downcase + "%","%"  + params[:q].to_s.downcase + "%","%"  + params[:q].to_s.downcase + "%","%"+ params[:q].to_s.downcase + "%","%"  + params[:q].to_s.downcase + "%","%"  + params[:q].to_s.downcase + "%").page(params[:page]).order(params[:sort])
   end
end

