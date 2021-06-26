require 'rails_helper.rb'
require 'support/dbcleaner.rb'

describe GroupsController, type: :controller do
    
    context "as a Student and Group Leader of a group" do
        before :each do
            @student = User.create!(:email=>"user@studenti.uniroma1.it", :password => "password", :roles_mask => 1)            
            Profile.create!(:name => "Kungfu", :surname => "Panda", :reg_number => 123456, :province => "Roma", :description => "Sono uno studente.", :user_id => @student.id)
            sign_in @student
        end 

        before do
            exam = Exam.create!(:teacher => "Alberto Angela", :subject => "Tuttologia")
            @group = Group.create!(:descrizione=> "", :max_members => 3, :exam_id=>exam.id, :leader_id=>@student.id)
            Belonging.create!(:user_id => @student.id, :group_id => @group.id)
        end
        it "should delete group" do
            get :delete_group, :params=>{:group_id => @group.id}
            g_tst =Group.where(:id => @group.id) 
            expect(g_tst).to be_empty
        end

    end
end