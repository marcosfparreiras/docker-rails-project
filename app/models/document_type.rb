class DocumentType < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true, uniqueness: true

  VALID_SLUGS = [
    'passport', 'transcript_hs', 'transcript_univ',
    'translated_transcirpt_univ', 'gpa', 'sat', 'toefl'
  ].freeze
  validates_inclusion_of :slug, in: VALID_SLUGS
end
