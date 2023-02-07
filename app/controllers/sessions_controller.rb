class SessionsController < ApplicationController

    def login
        
    end

    def logout

    end

    private
    def session_params
        params.require(:session).permit(:email, :password)
    end

end