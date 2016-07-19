class PagesController < ApplicationController
  def home
    @bugs = Bug.all
    if params[:search]
      @bugs = Bug.search(params[:search])
    else
      @bugs = Bug.all
    end
  end
end
