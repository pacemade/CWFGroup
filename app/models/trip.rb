class Trip < ApplicationRecord

  belongs_to :user

  validates :first_name, :last_name, :start_date, :end_date, :birthday, presence: true

end
