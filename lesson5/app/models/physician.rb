class Physician < ApplicationRecord
    has_many :appointments
    has_many :diagnosis_items
    has_many :patients, through: :appointments
    validates :phone, presence: true, format: { with: /\+?380\d{9}/, message: "only UA phones" }
    validates :level, presence: true, inclusion: {in: %w(junior middle senior), message: "%{value} is not a valid level" }
end
