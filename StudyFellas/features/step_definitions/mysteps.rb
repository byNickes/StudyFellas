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
    assert page.has_content?(exam)
    assert page.has_content?(teacher)
end


Given 'I am authenticated as student' do
    u = User.create!(:email=>"user@studenti.uniroma1.it", :password => "password", :roles_mask => 1)
    p = Profile.create!(:name => "Kungfu", :surname => "Panda", :reg_number => 123456, :province => "Roma", :description => "Sono uno studente.", :user_id => u.id)
    visit "/"
    fill_in "Email", with: "user@studenti.uniroma1.it"
    fill_in "Password", with: "password"
    click_button "Accedi"
end

When('I select option {string} from element {string} and I fill in {string} with {string} and I select option {string} from element {string}') do |exam, selector_exam, description_field, description, maxmembers, selector_max|
    page.select exam, :from => selector_exam
    page.select maxmembers, :from => selector_max
    fill_in(description_field, :with=>description)
end

Then('I should see {string} and {string} and {string} and {string}') do |string, string2, string3, string4|
    assert page.has_content?(string)
    assert page.has_content?(string2)
    assert page.has_content?(string3)
    assert page.has_content?(string4)
end

Given('There is an exam with teacher {string} and subject {string}') do |teacher, subject|
    Exam.create!(:teacher => teacher, :subject => subject)
end

Given('There is a group with teacher {string} and subject {string}') do |teacher, subject|
    pending # Write code here that turns the phrase above into concrete actions
end

Given('I am leader of a group with teacher {string} and subject {string}') do |teacher, subject|
    pending # Write code here that turns the phrase above into concrete actions
end

Given('There is a request for the group') do
    pending # Write code here that turns the phrase above into concrete actions
end

When('I am on group board') do
    pending # Write code here that turns the phrase above into concrete actions
end

Then('I should see the member in participants list') do
    pending # Write code here that turns the phrase above into concrete actions
end