class DiagnosisItem < ApplicationRecord
  belongs_to :patient
  belongs_to :physician

  validates :content, length: { in: 1..200 }
end
