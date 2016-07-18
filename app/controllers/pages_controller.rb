class PagesController < ApplicationController
  def home
    @bugs = Bug.all
  end
end
