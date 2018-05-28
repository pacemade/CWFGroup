class PoliciesController < ApplicationController
  require 'json'
  skip_before_action :verify_authenticity_token

  def search_policies
    @params = session[:trip_params]
    @policies = SearchPolicies.new(@params).results
    @coverage = session[:trip_params][:coverage]
    convert_birthday
    @age = age(@birthday)
    @days = trip_days(convert_end_date(params),convert_start_date(params) )
    render 'find_policies', layout: false
  end

  private

  def convert_start_date(params)
    trip = params[:trip]
    @start_date = Date.new trip["start_date(1i)"].to_i, trip["start_date(2i)"].to_i, trip["start_date(3i)"].to_i
  end

  def convert_end_date(params)
    trip = params[:trip]
    @end_date = Date.new trip["end_date(1i)"].to_i, trip["end_date(2i)"].to_i, trip["end_date(3i)"].to_i
  end

  def trip_days(end_date, start_date)
    (end_date - start_date).to_i
  end

  def convert_birthday
    trip = @params[:trip]
    @birthday = Date.new trip["birthday(1i)"].to_i, trip["birthday(2i)"].to_i, trip["birthday(3i)"].to_i
  end

  def age(birthday)
    now = Time.now.utc.to_date
    now.year - @birthday.year - ((now.month > @birthday.month || (now.month == @birthday.month && now.day >= @birthday.day)) ? 0 : 1)
  end

end
