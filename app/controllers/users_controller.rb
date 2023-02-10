class UsersController < ApplicationController

    def profile
        user = User.includes(stories: [:quote]).find_by(id: 1)
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
