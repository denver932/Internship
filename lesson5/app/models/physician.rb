class Physician < ApplicationRecord
  has_many :appointments
  has_many :diagnosis_items
  has_many :patients, through: :appointments

  validates :first_name, :last_name, length: { in: 6..20 }
  validates :phone, presence: true, format: { with: /\A\+?380\d{9}\z/, message: 'only UA phones' }
  validates :level, presence: true, inclusion: { in: '%w(junior middle senior)' }
end
