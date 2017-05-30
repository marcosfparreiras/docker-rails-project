require 'rails_helper'

RSpec.describe Plan, type: :model do
  context 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_presence_of(:value) }
    it { should have_many(:players).class_name('Player') }
    it { should have_one(:priority).class_name('Priority') }
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

  context 'association with player' do
    before :all do
      Player.destroy_all
      Plan.destroy_all
      pass = 'pass'
      plan1 = Plan.create(name: 'Plan 1', value: 299)
      plan2 = Plan.create(name: 'Plan 2', value: 199)

      Player.create(
        name: 'Player 1', email: 'email1@mail.com', password: pass, plan: plan1
      )
      Player.create(
        name: 'Player 2', email: 'email2@mail.com', password: pass, plan: plan1
      )
      Player.create(
        name: 'Player 3', email: 'email3@mail.com', password: pass, plan: plan2
      )
      Player.create(
        name: 'Player 4', email: 'email4@mail.com', password: pass, plan: plan2
      )
    end

    it 'creates 2 players' do
      expect(Player.count).to eq(4)
    end

    it 'creates 2 plans' do
      expect(Plan.count).to eq(2)
    end
  end
end
