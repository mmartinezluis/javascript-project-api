class StoriesController < ApplicationController
  before_action :set_story, only: [:show, :update, :destroy]
  
  def index
    stories = Story.includes(:quote).last 20
    render json: StoryBlueprint.render(stories, view: :normal)
  end
  
  def show
    render json: StoryBlueprint.render(@story)
  end
  
  def create
    user = User.find_by(id: story_params[:user_id])
    render json: "User must exist", status: :not_acceptable and return if !user
    quote = user.stories.find_by(quote_id: story_params[:quote_id])
    render json: "You already have a story for this quote!", status: :not_acceptable and return if quote
    story = Story.new(story_params)
    if story.save
      render json: StoryBlueprint.render(story, view: :normal), status: :created
    else
      render json: story.errors.full_messages.join("; "), status: :not_acceptable
    end
  end

  def update
    if @story.user_id != story_params[:user_id]
      render json: "Your are trying to update another user's story", status: :not_acceptable
    elsif @story.update(story_params)
      render json: StoryBlueprint.render(@story, view: :normal), status: :ok
    else
      render json: @story.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    if @story.user_id.to_s != params[:user_id]
      render json: "Your are trying to delete another user's story", status: :not_acceptable
    elsif @story.destroy
      render :nothing => true, status: :no_content
    else 
      render json: @story.errors.full_messages, status: :unprocessable_entity
    end
  end

  private
    def set_story
      @story = Story.find_by(id: params[:id])
      render json: "Story not found", status: 404 and return if !@story
    end

    def story_params
      params.require(:story).permit(:description, :user_id, :quote_id)
    end
  end
  