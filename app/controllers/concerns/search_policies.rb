class SearchPolicies

  attr_reader :results

  def initialize(params)
    @params = params
    convert_birthday
    @age = age(@birthday)
    @results = Policy.where('min_age <= ? and max_age >= ?', @age, @age)
  end

  def filter_by_coverage
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
