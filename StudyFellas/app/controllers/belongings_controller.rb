class BelongingsController < ApplicationController

  def new
    Belonging.create!(:user_id => params[:user_id], :group_id => params[:group_id])
    redirect_to group_path(params[:group_id])
  end

  def destroy
  end
  
end
