class AttractionController < ApplicationController
    def genre_p(list)
        if not params[:genres]
            list.each do |item|
                @attractions << item
            end
            return
        end
        list.each do |item|
            genres = []
            tmp = item.genre.split('"').each_slice(2).map(&:last)
            tmp.pop
            tmp.each do |genre|
                genres << genre
            end
            genre_num = 0
            genres.each do |genre1|
                params[:genres].each do |genre2|
                    if genre1 == genre2
                        genre_num += 1
                    end
                end
            end
            if genre_num == params[:genres].length
                @attractions << item
            end
        end
    end
    
    def index
        if params[:prefecture]
            @attractions = []
            if params[:order] == "name"
                @attractions_list = Attraction.all.order(name: "ASC").where(prefecture: params[:prefecture])
                genre_p(@attractions_list)
            else
                @attractions_list = Attraction.all.order(id: params[:order]).where(prefecture: params[:prefecture])
                genre_p(@attractions_list)
            end
        else
            if params[:order]
                @attractions = []
                if params[:order] == "name"
                    @attractions_list = Attraction.all.order(name: "ASC")
                    genre_p(@attractions_list)
                else
                    @attractions_list = Attraction.all.order(id: params[:order])
                    genre_p(@attractions_list)
                end
            else
                @attractions = Attraction.all
            end
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
        if params[:prefecture] == "全国"
            params[:prefecture] = nil
        end
        @genres = ["レジャー", "文化・歴史", "自然", "芸術", "ショッピング", "温泉", "生き物"]
        genres_list = []
        @genres.each do |genre|
            if params[:genres][genre] == ["0", "1"]
                genres_list << genre
            end
        end
        redirect_to root_path(order: params[:order], prefecture: params[:prefecture], genres: genres_list)
    end
end