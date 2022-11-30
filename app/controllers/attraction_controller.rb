class AttractionController < ApplicationController
    def index
        @attractions = Attraction.all
    end
    
    def new
        @attraction = Attraction.new
    end
    
    def create
        @attraction = Attraction.new(name: params[:attraction][:name], prefecture: params[:attraction][:prefecture], 
        text: params[:attraction][:text], url: params[:attraction][:url], genre: params[:attraction][:genre], 
        open_time: params[:attraction][:open_time], contact: params[:attraction][:contact], 
        user_id: params[:attraction][:user_id], time: params[:attraction][:time], address: params[:attraction][:address])
        if 
            redirect_to root_path
        else
            render new_attraction_path
        end
    end
    
    def show
        #@attraction = Attraction.find(params[:id])
        @review = Review.find_by(attraction_id: params[:id])
    end
    
    def edit
        @attraction = Attraction.find(params[:id])
    end
    
    def update
        @attraction = Attraction.find(params[:id])
        if @Tweet.update(message: params[:tweet][:message], image: params[:tweet][:image].read)
            redirect_to root_path
        else
            render edit_attraction_path
        end
    end
    
    def destroy
        @attraction = Attraction.find(params[:id])
        @attraction.destroy
        redirect_to root_path
    end
end
