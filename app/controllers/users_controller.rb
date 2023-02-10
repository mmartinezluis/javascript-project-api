class UsersController < ApplicationController

    def profile
        # @TODO: Move the quotes to a caching database
        # so that the main database does not need to be queried
        # for quotes as quotes are static data
        user = User.includes(stories: [:quote]).find_by(id: user_params[:id])
        if user
            render json: UserBlueprint.render(user, view: :profile)
        else
            render json: {message: "User not found"}, status: :not_found
        end
    end

    private 
    def user_params
        params.require(:user).permit(:id)
    end
end
