require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:todos) }
  it { should validate_presence_of(:email) }
  it 'validates password length' do
    FactoryBot.build(:user, password: '12345').should_not be_valid
    FactoryBot.build(:user, password: '12345678').should be_valid
  end
end
