class Document < ApplicationRecord
  validates_inclusion_of :status, in: [0, 1, 2]
  belongs_to :document_type
  belongs_to :player

  STATUS_MISSING = 0
  STATUS_PENDENT = 1
  STATUS_OK = 2

  def missing?
    status == 0
  end

  def pending?
    status == 1
  end

  def ok?
    status == 2
  end
end
