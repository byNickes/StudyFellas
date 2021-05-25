Canard::Abilities.for(:user) do
  cannot [:create, :delete, :index], Exam
end
