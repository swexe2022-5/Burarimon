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
                @attractions = Attraction.all.order(id: "DESC")
            end
        end
    end
    
    def new
        @genres = ["レジャー", "文化・歴史", "自然", "芸術", "ショッピング", "温泉", "生き物", "その他"]
        @attraction = Attraction.new(user_id: params[:user_id])
    end
    
    def create
        @genres = ["レジャー", "文化・歴史", "自然", "芸術", "ショッピング", "温泉", "生き物", "その他"]
        if params[:attraction][:picture1]
            pic1 = params[:attraction][:picture1].read
        else
            pic1 = nil
        end
        if params[:attraction][:picture2]
            pic2 = params[:attraction][:picture2].read
        else
            pic2 = nil
        end
        if params[:attraction][:picture3]
            pic3 = params[:attraction][:picture3].read
        else
            pic3 = nil
        end
        if params[:attraction][:picture4]
            pic4 = params[:attraction][:picture4].read
        else
            pic4 = nil
        end
        if params[:attraction][:picture5]
            pic5 = params[:attraction][:picture5].read
        else
            pic5 = nil
        end
        if params[:attraction][:picture6]
            pic6 = params[:attraction][:picture6].read
        else
            pic6 = nil
        end
        @attraction = Attraction.new(name: params[:attraction][:name], prefecture: params[:attraction][:prefecture], 
        text: params[:attraction][:text], url: params[:attraction][:url], genre: params[:attraction][:genre], 
        open_time: params[:attraction][:open_time], contact: params[:attraction][:contact], address: params[:attraction][:address], 
        user_id: current_user.id, time: Time.current, picture1: pic1, picture2: pic2, 
        picture3: pic3, picture4: pic4, picture5: pic5, picture6: pic6)
        if @attraction.save
            flash[:notice] = "観光地を投稿しました。"
            redirect_to root_path
        else
            render "new"
        end
    end
    
    def show
        @attraction = Attraction.find(params[:id])
        @review = Review.where(attraction_id: params[:id])
    end
    
    def edit
        @genres = ["レジャー", "文化・歴史", "自然", "芸術", "ショッピング", "温泉", "生き物", "その他"]
        @attraction = Attraction.find(params[:id])
    end
    
    def update
        @genres = ["レジャー", "文化・歴史", "自然", "芸術", "ショッピング", "温泉", "生き物", "その他"]
        @attraction = Attraction.find(params[:id])
        if params[:attraction][:picture1]
            pic1 = params[:attraction][:picture1].read
        elsif not @attraction.picture1.nil?
            pic1 = @attraction.picture1
        else
            pic1 = nil
        end
        if params[:attraction][:picture2]
            pic2 = params[:attraction][:picture2].read
        elsif not @attraction.picture2.nil?
            pic2 = @attraction.picture2
        else
            pic2 = nil
        end
        if params[:attraction][:picture3]
            pic3 = params[:attraction][:picture3].read
        elsif not @attraction.picture3.nil?
            pic3 = @attraction.picture3
        else
            pic3 = nil
        end
        if params[:attraction][:picture4]
            pic4 = params[:attraction][:picture4].read
        elsif not @attraction.picture4.nil?
            pic4 = @attraction.picture4
        else
            pic4 = nil
        end
        if params[:attraction][:picture5]
            pic5 = params[:attraction][:picture5].read
        elsif not @attraction.picture5.nil?
            pic5 = @attraction.picture5
        else
            pic5 = nil
        end
        if params[:attraction][:picture6]
            pic6 = params[:attraction][:picture6].read
        elsif not @attraction.picture6.nil?
            pic6 = @attraction.picture6
        else
            pic6 = nil
        end
        
        if @attraction.update(name: params[:attraction][:name], prefecture: params[:attraction][:prefecture], 
        text: params[:attraction][:text], url: params[:attraction][:url], genre: params[:attraction][:genre], 
        open_time: params[:attraction][:open_time], contact: params[:attraction][:contact], address: params[:attraction][:address], 
        user_id: @attraction.user_id, time: Time.current, picture1: pic1, picture2: pic2, 
        picture3: pic3, picture4: pic4, picture5: pic5, picture6: pic6)
            flash[:notice] = "観光地情報を更新しました。"
            redirect_to attraction_path
        else
            flash[:error] = @attraction.errors.full_messages
            flash[:id] = @attraction.id
            puts "!23456789"
            @attraction.genre = []
            render "edit"
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
        @genres = ["レジャー", "文化・歴史", "自然", "芸術", "ショッピング", "温泉", "生き物", "その他"]
        genres_list = []
        @genres.each do |genre|
            if params[:genres][genre] == ["0", "1"]
                genres_list << genre
            end
        end
        redirect_to root_path(order: params[:order], prefecture: params[:prefecture], genres: genres_list)
    end

    def get_picture1
        attraction = Attraction.find(params[:id])
        send_data attraction.picture1, disposition: :inline, type: 'image/png'
    end
    
    def get_picture2
        attraction = Attraction.find(params[:id])
        send_data attraction.picture2, disposition: :inline, type: 'image/png'
    end
    
    def get_picture3
        attraction = Attraction.find(params[:id])
        send_data attraction.picture3, disposition: :inline, type: 'image/png'
    end
    def get_picture4
        attraction = Attraction.find(params[:id])
        send_data attraction.picture4, disposition: :inline, type: 'image/png'
    end
    
    def get_picture5
        attraction = Attraction.find(params[:id])
        send_data attraction.picture5, disposition: :inline, type: 'image/png'
    end
    
    def get_picture6
        attraction = Attraction.find(params[:id])
        send_data attraction.picture6, disposition: :inline, type: 'image/png'
    end
end