require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }
    # it { should validate_uniqueness_of :api_key }
    # it { should validate_presence_of(:api_key) }
  end

  describe 'relationships' do
    it { should have_many :favorites }
  end

  describe 'instance methods' do
    describe '#generate_api_key' do
      it 'assings a random uuid for api_key' do
        user = build(:user)
        expect(user.api_key).to be_nil
        user.generate_api_key
        expect(user.api_key).to be_a(String)
      end
    end
  end
end
