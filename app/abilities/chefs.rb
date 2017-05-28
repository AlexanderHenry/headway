Canard::Abilities.for(:chef) do
  can [:read, :update, :create], Recipe
  
end
