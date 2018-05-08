class PoliciesController < ApplicationController
  require 'json'
  skip_before_action :verify_authenticity_token

  def search_policies
    @policies = SearchPolicies.new(params).results
    @coverage = params[:trip][:coverage]
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


end
