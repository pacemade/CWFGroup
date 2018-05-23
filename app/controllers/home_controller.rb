class HomeController < ApplicationController
  def index
    redirect_to '/users/1/trips/new'
  end
end
