class Trip < ApplicationRecord

  belongs_to :user
  belongs_to :policy

  # validates :first_name, :last_name, :start_date, :end_date, :birthday, :coverage, :cvv, :credit_card_number, :expiry_date, presence: true
  # validate :end_time_cannot_be_before_start

  validate :birthday, :if => lambda { |o| o.current_step == 'single_trip_plan' }

  attr_writer :current_step

  def current_step
    @current_step || steps.first
  end

  def steps
    %w[plans single_trip_plan deductible eligibility credit_card policy_results disclaimer personal_info]
  end

  def next_step
    self.current_step = steps[steps.index(current_step)+1]
  end

  def previous_step
    self.current_step = steps[steps.index(current_step)-1]
  end

  def eligibility_step?
    current_step == steps[3]
  end

  def first_step?
    current_step == steps.first
  end

  def last_step?
    current_step == steps.last
  end



  private

  def end_time_cannot_be_before_start
    if self[:start_date] && self[:end_date] && self[:start_date] > self[:end_date]
      errors.add(:_, "The end date cannot be before the start date. Please try again.")
    end
  end

end
