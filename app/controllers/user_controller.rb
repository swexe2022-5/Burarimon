class UserController < ApplicationController
    def index
        if session[:login_uid]
            session.delete(:login_uid)
            redirect_to root_path
        end
    end
    
    def new
        @user = User.new
    end
    
    def create
        if params[:user][:file]
            @user = User.new(name: params[:user][:name], pass: params[:user][:password], profile: params[:user][:profile], icon: params[:user][:file].read, owner: params[:user][:owner])
        else
            @user = User.new(name: params[:user][:name], pass: params[:user][:password], profile: params[:user][:profile], owner: params[:user][:owner])
        end
        if @user.save
            flash[:notice] = "新規登録しました。"
            redirect_to user_index_path
        end
    end
    
    def login
        if a = User.find_by(name: params[:uid])
            if a.pass == params[:pass]
                session[:login_uid] = params[:uid]
                redirect_to root_path
            else
                redirect_to user_index_path
            end
        else
            redirect_to user_index_path
        end
    end
end
