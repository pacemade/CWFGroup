class TripsController < ApplicationController

  def new
    @trip = Trip.new
    @user = User.find(params[:user_id])
  end

  def create
    @params = params
    @user = User.find(params[:user_id])
    @trip = Trip.new(trip_params)
    @trip.user = @user
    @trip.policy = Policy.find(params[:policy])

    if @trip.save
      flash[:notice] = "Trip saved!"
      redirect_to root_path
    else
      flash.now[:alert] = @trip.errors.full_messages
      render 'new'
    end
  end

  private

  def trip_params
    params.require(:trip).permit(:start_date, :end_date, :birthday, :first_name, :last_name, :coverage, :policy_id)
  end

end
