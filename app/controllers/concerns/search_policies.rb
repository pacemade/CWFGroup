class SearchPolicies

  attr_reader :results

  def initialize(params)

    @params = params
    convert_birthday
    @age = age(@birthday)
    if @age <= 65
      @results = Policy.where('min_age <= ? and max_age >= ?', @age, @age)
    else
      @results = Policy.where('max_age >= ?', 65)
    end
  end

  def convert_birthday
    @birthday = Date.new @params["birthday(1i)"].to_i, @params["birthday(2i)"].to_i, @params["birthday(3i)"].to_i
  end

  def age(birthday)
    now = Time.now.utc.to_date
    now.year - @birthday.year - ((now.month > @birthday.month || (now.month == @birthday.month && now.day >= @birthday.day)) ? 0 : 1)
  end

end
