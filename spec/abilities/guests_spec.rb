require 'rails_helper'
require 'cancan/matchers'

describe Canard::Abilities, '#guests' do
  let(:acting_guest) { FactoryGirl.create(:user, :guest) }
  subject(:guest_ability) { Ability.new(acting_guest) }

  describe 'on User' do
    let(:user) { FactoryGirl.create(:user) }

    it { is_expected.to be_able_to(:create, user) }
  end
  # on User
end
