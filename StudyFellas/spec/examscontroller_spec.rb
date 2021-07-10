require 'rails_helper.rb'
require 'support/dbcleaner.rb'

describe ExamsController, type: :controller do
    
    context "as an Administrator" do
        before :each do
            @admin = User.create!(:email=>"admin@studenti.uniroma1.it", :password => "password", :roles_mask => 2)            
            Profile.create!(:name => "Mario", :surname => "Draghi", :reg_number => 12356455, :province => "Roma", :description => "Sono un amministratore.", :user_id => @admin.id)
            sign_in @admin
        end 

        before do
            @exam = Exam.create!(:teacher => "Alberto Angela", :subject => "Tuttologia")
        end
        it "should delete exam" do
            get :delete, :params=>{use_route: 'exams', :teacher => @exam.teacher, :subject => @exam.subject}
            e_tst =Exam.where(:id => @exam.id) 
            expect(e_tst).to be_empty
        end

    end
end