class StoriesController < ApplicationController
  before_action :set_story, only: [:show, :update, :destroy]
  
  def index
    stories = Story.includes(:quote).all
    render json: StoryBlueprint.render(stories, view: :normal)
  end
  
  def show
    render json: StoryBlueprint.render(@story)
  end
  
  def create
    story = Story.new(story_params)
    if story.save
      render json: StoryBlueprint.render(story, view: :normal), status: 200
    else
      render json: story.errors.full_messages.join("; "), status: :not_acceptable
    end
  end

  def update
    if !@story  
      # render json: "Story not found", status: 404
    elsif @story.id != story_params[:user_id]
      render json: "Your are trying to update another user's story", status: :not_acceptable
    elsif @story.update(story_params)
      render json: StoryBlueprint.render(@story, view: :normal), status: 200
    else
      render json: @story.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    if @story.destroy
      render json: {message: "Story ##{@story.id} successfully deleted"}
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
  