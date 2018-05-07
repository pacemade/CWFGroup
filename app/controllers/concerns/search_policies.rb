class SearchPolicies

  def initialize(params)
    @params = params
  end

  def filter_by_coverage
  end

  def age(birthday)
    now = Time.now.utc.to_date
    now.year - birthday.year - ((now.month > birthday.month || (now.month == birthday.month && now.day >= birthday.day)) ? 0 : 1)
  end

end
