require 'rails_helper'
require 'cancan/matchers'

describe Canard::Abilities, '#chefs' do
  let(:acting_chef) { FactoryGirl.create(:user, :chef) }
  subject(:chef_ability) { Ability.new(acting_chef) }

  describe 'on Recipe' do
    let(:recipe) { FactoryGirl.create(:recipe) }

    it { is_expected.to be_able_to(:create, recipe) }
    it { is_expected.to be_able_to(:read, recipe) }
    it { is_expected.to be_able_to(:edit, recipe) }
  end
  # on Recipe
end
