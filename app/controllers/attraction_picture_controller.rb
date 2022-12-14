class AttractionPictureController < ApplicationController
    def create
        def new
        @picture = Attractionpicture.new(attraction_id: params[:attraction_id])
    end
    
    def create
        @picture = Attractionpicture.new(attraction_id: params[:attraction_id], picture: )
        @picture.save
    end
    def get_image
        a_picture = User.find(params[:id])
        send_data a_picture.picture, disposition: :inline, type: 'image/png'
    end
end
