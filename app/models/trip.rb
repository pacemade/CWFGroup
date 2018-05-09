class Trip < ApplicationRecord

  belongs_to :user
  belongs_to :policy

  validates :first_name, :last_name, :start_date, :end_date, :birthday, :coverage, presence: true
  validate :end_time_cannot_be_before_start


  def age(birthday)
    now = Time.now.utc.to_date
    now.year - birthday.year - ((now.month > birthday.month || (now.month == birthday.month && now.day >= birthday.day)) ? 0 : 1)
  end

  def end_time_cannot_be_before_start
    if self[:start_date] && self[:end_date] && self[:start_date] > self[:end_date]
      errors.add(:_, "The end date cannot be before the start date. Please try again.")
    end
  end

end
