Given 'I am authenticated as admin' do
    u = User.create!(:email=>"admin@uniroma1.it", :password => "password", :roles_mask => 2)
    p = Profile.create!(:name => "Magnifico", :surname => "Rettore", :reg_number => 9112001, :province => "Roma", :description => "Sono un admin.", :user_id => u.id)
    visit "/"
    fill_in "Email", with: "admin@uniroma1.it"
    fill_in "Password", with: "password"
    click_button "Accedi"
end

Given 'I am on StudyFellas Homepage' do
    visit "/"
    assert page.has_content?("StudyFellas Homepage")
end

#sia per gestisci esami disponibili che aggiungi esame
When 'I press {string}' do |button|
    click_button(button)
end

Then 'I should be on the {string} page' do |string|
    assert page.has_content?(string)
end

When 'I fill in {string} with {string} and {string} with {string}' do |field1, exam, field2, teacher|
    fill_in(field1, :with=>exam)
    fill_in(field2, :with=>teacher)
end

And 'I should see {string} and {string}' do |exam, teacher|
    assert page.has_content?("Tuttologia")
    assert page.has_content?("Alberto Angela")
end


Given 'I am authenticated as student' do
    u = User.create!(:email=>"user@studenti.uniroma1.it", :password => "password", :roles_mask => 1)
    p = Profile.create!(:name => "Kungfu", :surname => "Panda", :reg_number => 123456, :province => "Roma", :description => "Sono uno studente.", :user_id => u.id)
    visit "/"
    fill_in "Email", with: "user@studenti.uniroma1.it"
    fill_in "Password", with: "password"
    click_button "Accedi"
end

When('I select option {string} from element {string} and I fill in {string} with {string} and I select option {string} from element {string}') do |string, string2, string3, string4, string5, string6|
    pending # Write code here that turns the phrase above into concrete actions
end

Then('I should see {string} and {string} and {string} and {string}') do |string, string2, string3, string4|
    pending # Write code here that turns the phrase above into concrete actions
end