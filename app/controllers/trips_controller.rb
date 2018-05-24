class TripsController < ApplicationController

  def new
    session[:trip_params] ||= {}
    @trip = Trip.new
    @user = User.find(params[:user_id])
    @trip = Trip.new(session[:trip_params])
    @trip.current_step = session[:trip_step]
  end

  def create
    session[:trip_params].deep_merge!(params[:trip]) if params[:trip]
    @user = User.find(params[:user_id])
    @trip = Trip.new(session[:trip_params])
    @trip.current_step = session[:trip_step]
    # if @trip.valid?
      if params[:back_button]
        @trip.previous_step
      elsif @trip.last_step?
        @trip.user = @user
        @trip.save
      else
        @trip.next_step
        binding.pry
      end
      session[:trip_step] = @trip.current_step
    # end
    if @trip.new_record?
      render 'new'
    else
      session[:trip_step] = session[:trip_params] = nil
      flash[:notice] = "Trip Submitted!"
      render 'new'
    end

  end



end

#
# def new
#   @trip = Trip.new
#   @user = User.find(params[:user_id])
# end
#
# def create
#   @params = params
#   @user = User.find(params[:user_id])
#   @trip = Trip.new(trip_params)
#   @trip.first_name = params[:first_name]
#   @trip.last_name = params[:last_name]
#   @trip.credit_card_number = params[:credit_card_number]
#   @trip.cvv = params[:cvv]
#   expiry = params[:expiry_date]
#   @trip.expiry_date = Date.new expiry["(1i)"].to_i, expiry["(2i)"].to_i, expiry["(3i)"].to_i
#   @trip.user = @user
#   @trip.policy = Policy.find(params[:policy].split[0].to_i)
#   @trip.rate_per_day = params[:policy].split[1].to_d
#
#   if @trip.save
#     flash[:notice] = "Trip saved!"
#     redirect_to root_path
#   else
#     flash.now[:alert] = @trip.errors.full_messages
#     render 'new'
#   end
# end
