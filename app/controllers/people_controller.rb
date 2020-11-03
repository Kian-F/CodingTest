class PeopleController < ApplicationController
  def index
    @people = Person.all
    # @people = Person.search(params[:search])
    

    # render :json => @people
  end
 

  def import
    Person.my_import(params[:file])
    Location.my_import(params[:file])
    redirect_to root_url, notice: "Successfuly Imported Data!"
  end

  def search
    @people = Person.where("name LIKE?","%"  + params[:q] + "%")
  end
end
