class UsersController < ApplicationController

    def profile
        # @TODO: Move the quotes to a caching database
        # so that the main database does not need to be queried
        # for quotes as quotes are static data
        user = User.includes(stories: [:quote]).find_by(id: params[:id])      
        if user
            render json: UserBlueprint.render(user, view: :profile)
        else
            render json: "User not found", status: :not_found
        end
    end

    def feed
        stories = Story.includes(:user, :quote).find_by(id: user_params[:story_ids])
        # stories = Story.includes(:user, :quote).find_by(id: [336, 334])
        stories = [] if !stories
        render json: StoryBlueprint.render(stories, view: :feed)
    end

    private 
    def user_params
        params.require(:user).permit(:story_ids => [])
    end
end
