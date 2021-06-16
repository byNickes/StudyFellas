Canard::Abilities.for(:admin) do
  can [:create, :delete, :index, :new], Exam
end
