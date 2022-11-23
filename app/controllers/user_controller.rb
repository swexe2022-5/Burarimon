class UserController < ApplicationController
    def index
        if session[:login_uid]
            session.delete(:login_uid)
            redirect_to root_path
        else
            render "login"
        end
    end
end
