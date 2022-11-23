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
        
        redirect_to root_path
    end
end
