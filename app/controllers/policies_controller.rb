class PoliciesController < ApplicationController
  require 'json'
  skip_before_action :verify_authenticity_token

  def search_policies
    @policies = SearchPolicies.new(params).results
    render 'find_policies', layout: false
  end

end
