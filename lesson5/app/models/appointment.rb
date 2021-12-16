class Appointment < ApplicationRecord
    belongs_to :physicians
    belongs_to :patients
end
