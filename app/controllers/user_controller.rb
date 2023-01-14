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
        if params[:user][:icon]
            icon = params[:user][:icon].read
        else
            icon = nil
        end
        
        @user = User.new(name: params[:user][:name], password: params[:user][:password], password_confirmation: params[:user][:password_confirmation], profile: params[:user][:profile], icon: icon, owner: params[:user][:owner])
        
        if @user.save
            flash[:notice] = "新規登録しました。"
            redirect_to user_index_path
        else
            render 'new'
        end
    end
    
    def login
        if a = User.find_by(name: params[:uid])
            if BCrypt::Password.new(a.pass) == params[:pass]
                session[:login_uid] = params[:uid]
                flash[:notice] = "ログインしました。"
                redirect_to root_path
            else
                flash[:notice] = "ユーザー名またはパスワードが間違っています。"
                redirect_to user_index_path
            end
        else
            flash[:notice] = "ユーザー名またはパスワードが間違っています。"
            redirect_to user_index_path
        end
    end
    
    def show
        @user = User.find_by(name: params[:id])
    end

    def edit
        @user = User.find_by(name: params[:id])
    end
    
    def update
        @user = User.find_by(name: params[:id])
        if params[:user][:icon]
            icon = params[:user][:icon].read
        elsif not @user.icon.nil?
            icon = @user.icon
        else
            icon = nil
        end
        
        if @user.update(name: params[:user][:name], profile: params[:user][:profile], icon: icon, owner: params[:user][:owner])
            session[:login_uid] = params[:user][:name]
            flash[:notice] = "アカウント情報を更新しました。"
            redirect_to user_path(@user.name)
        else
            flash[:error] = @user.errors.full_messages
            render 'edit'
        end
    end
    
    def get_image
        user = User.find(params[:id])
        send_data user.icon, disposition: :inline, type: 'image/png'
    end
end