# Copyright (c) 2015, @sudharti(Sudharsanan Muralidharan)
# Socify is an Open source Social network written in Ruby on Rails This file is licensed
# under GNU GPL v2 or later. See the LICENSE.

class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def new
    @post = Post.new
  end
  
  def show
    @comments = @post.comments.all
  end

  def create
    @post = current_user.posts.new(post_params)
   # puts "Trying to create an object"
  #  puts @post.inspect
    if @post.save
      redirect_to :back
    else
      redirect_to :back, notice: @post.errors.full_messages.first
    end
  end

  def edit
  end

  def update
    @post.update(post_params)
    redirect_to @post
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to root_path }
    end
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:content,:idea_id)
    #params.require(:content).permit(:post)
  end
end
