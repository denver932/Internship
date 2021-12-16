class Patient < ApplicationRecord
    has_many :appointments
    has_many :diagnosis_items
    has_many :physicians, through: :appointments

    validates :email, presence: true
    validates :age, presence: true, numericality: {only_integer: true, greater_than: 0}
end
