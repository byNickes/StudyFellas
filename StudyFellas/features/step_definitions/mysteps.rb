Given 'I am authenticated as admin' do
    admin = User.create!(:email=>"admin@uniroma1.it", :password => "password", :roles_mask => 2)
    p = Profile.create!(:name => "Magnifico", :surname => "Rettore", :reg_number => 9112001, :province => "Roma", :description => "Sono un admin.", :user_id => admin.id)
    visit "/"
    fill_in "Email", with: "admin@uniroma1.it"
    fill_in "Password", with: "password"
    click_button "Accedi"
end

Given 'I am on StudyFellas Homepage' do
    visit "/"
    expect(page).to have_text "StudyFellas Homepage"
end

When 'I press {string}' do |button|
    click_button(button)
end

Then 'I should be on the {string} page' do |string|
    expect(page).to have_text string
end

When 'I fill in {string} with {string} and {string} with {string}' do |field1, exam, field2, teacher|
    fill_in(field1, :with=>exam)
    fill_in(field2, :with=>teacher)
end

And 'I should see {string} and {string}' do |exam, teacher|
    expect(page).to have_text exam
    expect(page).to have_text teacher
end


Given 'I am authenticated as student' do
    @student = User.create!(:email=>"user@studenti.uniroma1.it", :password => "password", :roles_mask => 1)
    p = Profile.create!(:name => "Kungfu", :surname => "Panda", :reg_number => 123456, :province => "Roma", :description => "Sono uno studente.", :user_id => @student.id)
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
    expect(page).to have_text string
    expect(page).to have_text string2
    expect(page).to have_text string3
    expect(page).to have_text string4
end

Given('There is an exam with teacher {string} and subject {string}') do |teacher, subject|
    @exam = Exam.create!(:teacher => teacher, :subject => subject)
end

Given('There is a group for this exam and I am the leader') do
    @group = Group.create!(:descrizione=> "", :max_members => 3, :exam_id=>@exam.id, :leader_id=>@student.id)
    Belonging.create!(:user_id => @student.id, :group_id => @group.id)
end

Given('There is a request for the group') do
    @requester = User.create!(:email=>"requester@studenti.uniroma1.it", :password => "password", :roles_mask => 1)
    @requester_p = Profile.create!(:name => "Bill", :surname => "Cosby", :reg_number => 123, :province => "Roma", :description => "Sono un richiedente.", :user_id => @requester.id)
    Request.create!(:user_id => @requester.id, :group_id => @group.id)
end

When('I am on group board') do
    visit "/groups/"+@group.id.to_s
    expect(page).to have_text "Board del gruppo"
end

Then('I should see the member in participants list') do
    expect(page).to have_text @requester_p.name
    expect(page).to have_text @requester_p.surname
end
  