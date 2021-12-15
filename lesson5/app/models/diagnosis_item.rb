class DiagnosisItem < ApplicationRecord
    belongs_to :patient
    belongs_to :physician
end
