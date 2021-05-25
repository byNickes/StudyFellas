Canard::Abilities.for(:admin) do
  can [:create, :delete, :index], Exam
end
