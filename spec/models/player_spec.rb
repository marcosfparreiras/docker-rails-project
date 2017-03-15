require 'rails_helper'

RSpec.describe Player, type: :model do
  context 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should belong_to(:plan).class_name('Plan') }
  end
end
