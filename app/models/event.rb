class Event < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: { maximum: 30 }
  validates :description, presence: true, length: { maximum: 300 }
  validates :start_date, presence:true
  validates :organiser_name, presence:true
  validates :target_department, presence:true
end
