class PeopleController < ApplicationController
  # helper_method :sort_column, :sort_direction

  def index
      @people = Person.page(params[:page]).order(params[:sort])
    # render :json => @people
    # @people = Person.all
  end
 

  def import
    Person.my_import(params[:file])
    redirect_to root_url, notice: "Successfuly Imported Data!"
  end

  def search
    
    # if params[:q].blank?  
    #   redirect_to(search_path, alert: "Empty field!") and return  
    
    @people = Person.where("name LIKE? OR first LIKE? OR last LIKE? OR location LIKE? OR species LIKE? OR gender LIKE? OR affiliations LIKE? OR weapon LIKE? OR vehicle LIKE? ","%"  + params[:q].to_s.downcase + "%","%"  + params[:q].to_s.downcase + "%","%"  + params[:q].to_s.downcase + "%","%"  + params[:q].to_s.downcase + "%","%"+ params[:q].to_s.downcase + "%","%"  + params[:q].to_s.downcase + "%","%"  + params[:q].to_s.downcase + "%","%"  + params[:q].to_s.downcase + "%","%"  + params[:q].to_s.downcase + "%").page(params[:page]).order(params[:sort])
   end
end

# def sort_column
#   params[:sort] || "name"
# end
# def sort_direction
#   params[:direction] || "asc"
# end