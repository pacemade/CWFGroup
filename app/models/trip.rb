class Trip < ApplicationRecord

  belongs_to :user
  belongs_to :policy

  # validates :first_name, :last_name, :start_date, :end_date, :birthday, :coverage, :cvv, :credit_card_number, :expiry_date, presence: true
  # validate :end_time_cannot_be_before_start

  attr_writer :current_step

  def current_step
    @current_step || steps.first
  end

  def steps
    %w[plans single_trip_plan eligibility]
  end

  def next_step
    self.current_step = steps[steps.index(current_step)+1]
  end





  private

  def end_time_cannot_be_before_start
    if self[:start_date] && self[:end_date] && self[:start_date] > self[:end_date]
      errors.add(:_, "The end date cannot be before the start date. Please try again.")
    end
  end

end
