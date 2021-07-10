require 'rails_helper.rb'
require 'support/dbcleaner.rb'

describe ProfilesController, type: :controller do
    context "As a Student" do
        before :each do
            @student = User.create!(:email=>"user@studenti.uniroma1.it", :password => "password", :roles_mask => 1)            
            @prof = Profile.create!(:name => "Ugo", :surname => "Fantozzi", :reg_number => 1010101, :province => "Roma", :description => "Faccio l'accento svedese?", :user_id => @student.id)
            sign_in @student
        end

        it "should edit profile" do
            params = {:profile => {:user_id => @student.id, :name => "Ugo", :surname => "Fantozzi", :reg_number => 1010101, :description => "Fantozzi è lei?"}, :province => "Roma"}
            get :update, :params => params
            p_tst = Profile.find(@prof.id)
            expect(p_tst.description).eql?("Fantozzi è lei?")
        end
    end
end