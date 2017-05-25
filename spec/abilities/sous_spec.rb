require 'rails_helper'
require 'cancan/matchers'

describe Canard::Abilities, '#sous' do
  let(:acting_sous) { FactoryGirl.create(:user, :sous) }
  subject(:sous_ability) { Ability.new(acting_sous) }

  describe 'on Recipe' do
    let(:recipe) { FactoryGirl.create(:recipe) }

    it { is_expected.to be_able_to(:read, recipe) }
    it { is_expected.to be_able_to(:edit, recipe) }
  end
  # on Recipe
end
