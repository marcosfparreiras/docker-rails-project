class Document < ApplicationRecord
  validates_inclusion_of :status, in: [0, 1, 2]
  belongs_to :document_type
  belongs_to :player

  scope :pending, -> { where(status: STATUS_PENDING) }

  STATUS_MISSING = 0
  STATUS_PENDING = 1
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

  def status_name
    return 'missing' if status == 0
    return 'pending' if status == 1
    return 'ok' if status == 2
  end
end
