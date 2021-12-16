class Patient < ApplicationRecord
    has_many :appointments
    has_many :diagnosis_items
    has_many :physicians, through: :appointments

    validates :first_name, :last_name, length: { in: 6..20 }
    #validates :first_name, :last_name,
    validates :email, presence: true
    validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP
    validates :age, presence: true, numericality: {only_integer: true, greater_than: 0, less_than: 100}
end
