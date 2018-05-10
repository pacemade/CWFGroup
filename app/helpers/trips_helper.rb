module TripsHelper

  def find_age(birthday)
    now = Time.now.utc.to_date
    now.year - birthday.year - ((now.month > birthday.month || (now.month == birthday.month && now.day >= birthday.day)) ? 0 : 1)
  end

  def find_days(end_date, start_date)
    ((end_date - start_date) + 1.day).to_i/1.day
  end

end
