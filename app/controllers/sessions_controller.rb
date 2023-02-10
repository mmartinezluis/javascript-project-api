class SessionsController < ApplicationController

    def login
        user = User.includes(stories: [:quote]).find_by(email: session_params[:email])
        if(user && user.authenticate(session_params[:password]))
            token = UserManager::FirebaseAuth.generate_token(user)
            render json: {token: token, user: UserBlueprint.render(user, view: :profile)}
        else 
            render json: {message: "Invalid email or password"}, status: :not_acceptable
        end
    end

    def signup
        user = User.new(session_params)
        # Make a post request to create user in DynamoDB
        if(user.save)
            token = UserManager::FirebaseAuth.generate_token(user)
            render json: {token: token, user: UserBlueprint.render(user, view: :profile)}
        else
            render json: { message: user.errors.full_messages.join("; ")}, status: :not_acceptable
        end
    end

    private
    def session_params
        params.require(:session).permit(:first_name, :last_name, :email, :password)
    end

end