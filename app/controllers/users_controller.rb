class UsersController < ApplicationController
  def show
     @user = User.find(params[:id])
     @ideas = Idea.where(project_owner_id: @user.id).order("created_at desc")
  end

  def index
     @users = User.all
  end
end
