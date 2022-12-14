class AttractionController < ApplicationController
    def index
        if params[:order]
            if params[:order] == "name"
                @attractions = Attraction.all.order(name: "ASC")
            else
                @attractions = Attraction.all.order(id: params[:order])
            end
        else
            @attractions = Attraction.all
        end
    end
    
    def new
        @genres = ["レジャー", "文化・歴史", "自然", "芸術", "ショッピング", "温泉", "生き物"]
        @attraction = Attraction.new(user_id: params[:user_id])
    end
    
    def create
        @attraction = Attraction.new(name: params[:attraction][:name], prefecture: params[:attraction][:prefecture], 
        text: params[:attraction][:text], url: params[:attraction][:url], genre: params[:attraction][:genre], 
        open_time: params[:attraction][:open_time], contact: params[:attraction][:contact], address: params[:attraction][:address], 
        user_id: params[:attraction][:user_id], time: Time.current)
        if @attraction.save
            redirect_to root_path
        else
            render new_attraction_path
        end
    end
    
    def show
        @attraction = Attraction.find(params[:id])
        @review = Review.where(attraction_id: params[:id])
    end
    
    def edit
        @genres = ["レジャー", "文化・歴史", "自然", "芸術", "ショッピング", "温泉", "生き物"]
        @attraction = Attraction.find(params[:id])
    end
    
    def update
        @attraction = Attraction.find(params[:id])
        if @attraction.update(name: params[:attraction][:name], prefecture: params[:attraction][:prefecture], 
        text: params[:attraction][:text], url: params[:attraction][:url], genre: params[:attraction][:genre], 
        open_time: params[:attraction][:open_time], contact: params[:attraction][:contact], address: params[:attraction][:address], time: Time.current)
            redirect_to root_path #後にshowページに変更
        else
            render edit_attraction_path
        end
    end
    
    def destroy
        @attraction = Attraction.find(params[:id])
        @attraction.destroy
        redirect_to root_path
    end
    
    def searchdb
        params[:prefecture]
        params[:genres]
        puts params[:genres]
        redirect_to root_path(order: params[:order], prefecture: params[:prefecture])
    end
end
