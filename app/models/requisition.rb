class Requisition < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: { minimum: 5 }
  validates :department, presence: true, length: { minimum: 5 }
  validates :preferred_start_date, presence: true
end
