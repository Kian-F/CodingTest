class PeopleController < ApplicationController
  def index
    @people = Person.all
    render :json => @people
  end

  def import
    Person.my_import(params[:file])
    redirect_to root_url, notice: "Successfuly Imported Data!"
  end
end