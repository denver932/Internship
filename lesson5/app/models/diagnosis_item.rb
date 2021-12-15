class DiagnosisItem < ApplicationRecord
    belongs_to :patients
    belongs_to :physicians
end
