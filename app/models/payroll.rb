class Payroll < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  # validates :period, presence: true
  default_scope -> { order(created_at: :desc) }
end
