Canard::Abilities.for(:admin) do
  includes_abilities_of :chef

  can [:destroy], User

end
