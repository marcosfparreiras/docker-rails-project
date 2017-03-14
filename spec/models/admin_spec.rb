require 'rails_helper'

RSpec.describe Admin, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:role) }
  it { should validate_presence_of(:password) }

  let(:admin) do
    Admin.new(
      name: 'Jhon Doe',
      email: 'jhondoe@doe.com',
      role: 'anyrole',
      password: 'mypass'
    )
  end

  context 'when has all admin attributes' do
    it 'creates a valid admin' do
      expect(admin).to be_valid
    end

    context 'when has righ password_confirmation' do
      it 'creates a valid admin' do
        admin.password_confirmation = 'mypass'
        expect(admin).to be_valid
      end
    end

    context 'when has a password_confirmation' do
      it 'does not create a valid admin' do
        admin.password_confirmation = 'other pass'
        expect(admin).not_to be_valid
      end
    end
  end

  describe '#admin?' do
    it 'returns true' do
      expect(admin.admin?).to be true
    end
  end

  describe '#super_admin?' do
    context 'when role is super_admin' do
      it 'returns true' do
        admin.role = 'super_admin'
        expect(admin.super_admin?).to be true
      end
    end

    context 'when role is not super_admin' do
      it 'returns false' do
        admin.role = 'admin'
        expect(admin.super_admin?).to be false
      end
    end
  end
end
