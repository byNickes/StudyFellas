class BelongingsController < ApplicationController

  def new
    user = User.find(params[:user_id])
    if(user.belongings.where(:group_id => params[:group_id]).empty?)
      Belonging.create!(:user_id => params[:user_id], :group_id => params[:group_id])
    end
    redirect_to group_path(params[:group_id])
  end
  
end
