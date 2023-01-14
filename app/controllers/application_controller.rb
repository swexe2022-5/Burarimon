class ApplicationController < ActionController::Base
private
    def current_user
        if session[:login_uid]
            User.find_by(name: session[:login_uid])
        end
    end
helper_method :current_user
end
