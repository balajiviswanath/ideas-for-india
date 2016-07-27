class IdeasController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
  before_action :set_idea, only: [:show, :edit, :update, :destroy, :upvote, :removevote]

  def index
    @ideas = Idea.order(:cached_votes_total => :desc)
    @categories = Category.all
  end

  def show
      @category = Category.find(@idea.category_id)
      @project_owner = User.find(@idea.project_owner_id)
      @post = Post.new
      @posts = Post.where(idea_id: @idea.id).order('created_at DESC').paginate(:page => params[:page], :per_page => 5)
  end

  def new
    @idea = Idea.new
  end

  # GET /ideas/1/edit
  def edit
  end

  # POST /ideas
  # POST /ideas.json
  def create
    @idea = Idea.new(idea_params)

    @idea.project_owner_id = current_user.id
    @idea.likes = 0
    
    respond_to do |format|
      if @idea.save
        format.html { redirect_to @idea, notice: 'Idea was successfully created.' }
        format.json { render :show, status: :created, location: @idea }
      else
        format.html { render :new }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ideas/1
  # PATCH/PUT /ideas/1.json
  def update
    respond_to do |format|
      if @idea.update(idea_params)
        format.html { redirect_to @idea, notice: 'Idea was successfully updated.' }
        format.json { render :show, status: :ok, location: @idea }
      else
        format.html { render :edit }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ideas/1
  # DELETE /ideas/1.json
  def destroy
    @idea.destroy
    respond_to do |format|
      format.html { redirect_to ideas_url, notice: 'Idea was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  #support acts_as_votable
  def upvote 
    @idea.liked_by current_user
   redirect_to :back
  end 
  
  def removevote
    @idea.unliked_by current_user
    redirect_to :back
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_idea
      @idea = Idea.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def idea_params
      params.require(:idea).permit(:title, :description, :video_url, :category_id)
    end
end
