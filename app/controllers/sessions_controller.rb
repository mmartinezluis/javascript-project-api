class SessionsController < ApplicationController

    def login
        token = UserManager::FirebaseAuth.generate_token(User.first)
        render json: {token: token}
    end

    def logout

    end

    private
    def session_params
        params.require(:session).permit(:email, :password)
    end

end