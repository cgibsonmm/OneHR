class Requisition < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: { minimum: 4 }
  validates :department, presence: true, length: { minimum: 4 }
  validates :preferred_start_date, presence: true
end
