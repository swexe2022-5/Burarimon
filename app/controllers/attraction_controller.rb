class AttractionController < ApplicationController
    def index
        @attractions = Attraction.all
    end
    
    def new
        @genres = ["レジャー", "文化・歴史", "自然", "芸術", "ショッピング", "温泉", "生き物"]
        @attraction = Attraction.new(user_id: params[:user_id])
    end
    
    def create
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
        user_id: params[:attraction][:user_id], time: Time.current, picture1: pic1, picture2: pic2, 
        picture3: pic3, picture4: pic4, picture5: pic5, picture6: pic6)
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
        user_id: params[:attraction][:user_id], time: Time.current, picture1: pic1, picture2: pic2, 
        picture3: pic3, picture4: pic4, picture5: pic5, picture6: pic6)
            redirect_to attraction_path
        else
            render edit_attraction_path
        end
    end
    
    def destroy
        @attraction = Attraction.find(params[:id])
        @attraction.destroy
        redirect_to root_path
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
