class UsersController < ApplicationController
  def show
     @user = User.find(params[:id])
     @ideas = Idea.where(project_owner_id: @user.id).order("created_at desc")
     
     #TODO: more elegant solution needed for this join. I need all ideas the user has commented on.
    @posts = Post.where(user_id: @user.id).order('created_at DESC')
    @ideas_comment = Hash.new
    @institute = Institute.find(@user.institute_id)
    @posts.each do |post|
      @ideas_comment[post.idea_id] = Idea.find(post.idea_id)
      
    end
  end

  def index
     @users = User.all
  end
end
