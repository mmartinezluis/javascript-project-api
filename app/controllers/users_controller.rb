class UsersController < ApplicationController

    def profile
        user = User.find_by(id: user_params[:id])
        if user
            render json: UserBlueprint.rneder(user, view: :profile)
        else
            render json: {message: "User not found"}, status: :not_found
        end
    end

    private 
    def user_params
        params.require(:user).permit(:id)
    end
end
