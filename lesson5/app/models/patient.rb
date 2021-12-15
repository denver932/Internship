class Patient < ApplicationRecord
    has_many :appointments
    has_many :diagnosis_items
    has_many :physicians, through: :appointments
    validates :age, :email, presence: true

end
