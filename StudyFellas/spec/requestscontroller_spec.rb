require 'rails_helper.rb'
require 'support/dbcleaner.rb'

describe RequestsController, type: :controller do
    context "As a student leader of a group" do
        before :each do
            @student = User.create!(:email=>"user@studenti.uniroma1.it", :password => "password", :roles_mask => 1)            
            Profile.create!(:name => "Kungfu", :surname => "Panda", :reg_number => 123456, :province => "Roma", :description => "Sono uno studente.", :user_id => @student.id)
            sign_in @student
        end
        
        before do
            exam = Exam.create!(:teacher => "Alberto Angela", :subject => "Tuttologia")
            @group = Group.create!(:descrizione=> "", :max_members => 3, :exam_id=>exam.id, :leader_id=>@student.id)
            Belonging.create!(:user_id => @student.id, :group_id => @group.id)

            @requester = User.create!(:email=>"requester@studenti.uniroma1.it", :password => "password", :roles_mask => 1)            
            Profile.create!(:name => "Diego Armando", :surname => "Maradona", :reg_number => 10, :province => "Napoli", :description => "El pibe de oro.", :user_id => @requester.id)
            @req = Request.create!(:user_id => @requester.id, :group_id => @group.id)
        end

        it "should refuse the request" do
            params = {:request_id => @req.id, :group_id => @group.id}
            delete :refuse, :params => params
            expect(@group.requests.count).eql?(0)
        end
    end
end