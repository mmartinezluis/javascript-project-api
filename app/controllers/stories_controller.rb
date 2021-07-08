class StoriesController < ApplicationController
  before_action :set_story, only: [:show, :update, :destroy]
  
  def index
    stories = Story.all
    render json: StoryBlueprint.render(stories, view: :normal)
  end
  
  def show
    render json: StoryBlueprint.render(@story)
  end
  
  def create
    story = Story.new(story_params)
      if story.save
      render json: StoryBlueprint.render(story, view: :normal)
    else
      render json: story.errors
    end
  end

  def update
    if @story.update(story_params)
      render json: StoryBlueprint.render(@story, view: :normal)
    else
      render json: @story.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @story.destroy
    render json: {message: "Story ##{@story.id} successfully deleted"}
  end

  private
    def set_story
      @story = Story.find(params[:id])
    end

    def story_params
      params.require(:story).permit(:description, :user_id, :quote_id)
    end
  end
  