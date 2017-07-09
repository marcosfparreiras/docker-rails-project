class Item < ApplicationRecord
  belongs_to :player

  STATUS_TEXT = {
    0 => 'unchecked',
    1 => 'pending',
    2 => 'done',
    3 => 'failed'
  }.freeze

  GLYPHICONS_CLASS = {
    0 => 'glyphicon glyphicon-unchecked',
    1 => 'glyphicon glyphicon-exclamation-sign',
    2 => 'glyphicon glyphicon-ok',
    3 => 'glyphicon glyphicon-remove'
  }.freeze

  def status_glyphicon
    GLYPHICONS_CLASS[status]
  end

  def status_text
    STATUS_TEXT[status].capitalize
  end
end
