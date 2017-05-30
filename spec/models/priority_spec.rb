require 'rails_helper'

RSpec.describe Priority, type: :model do
  context 'validations' do
    it { should belong_to(:player).class_name('Player') }
  end
end
