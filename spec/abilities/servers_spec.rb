require 'rails_helper'
require 'cancan/matchers'

describe Canard::Abilities, '#servers' do
  let(:acting_server) { FactoryGirl.create(:user, :server) }
  subject(:server_ability) { Ability.new(acting_server) }

  describe 'on Recipe' do
    let(:recipe) { FactoryGirl.create(:recipe) }

    it { is_expected.to be_able_to(:read, recipe) }
  end
  # on Recipe
end
