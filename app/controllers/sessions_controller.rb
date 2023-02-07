class SessionsController < ApplicationController

    def login
        user = User.find_by(email: session_params[:email])
        if(user && user.authenticate(session_params[:password]))
            token = UserManager::FirebaseAuth.generate_token(user)
            render json: {token: token}
        else 
            render json: {message: "Invalid email or password"}, status: :not_acceptable
        end
    end

    def logout

    end

    private
    def session_params
        params.require(:session).permit(:first_name, :last_name, :email, :password)
    end

end