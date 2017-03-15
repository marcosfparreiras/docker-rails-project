require 'rails_helper'

RSpec.describe Plan, type: :model do
  context 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:value) }
    it { should have_many(:players).class_name('Player') }
  end

  context 'when it has all the attributes' do
    let(:plan) do
      Plan.new(
        name: 'The Plan',
        value: 259.99,
        description: 'This is the example plain'
      )
    end

    it 'creates a valid plan from the parameters' do
      expect(plan).to be_valid
    end
  end
end
