class ReviewController < ApplicationController
    def new
        @review = Review.new(attraction_id: params[:attraction_id], user_id: params[:user_id])
    end
    
    def create
        @review = Review.new(text: params[:review][:text], time: Date.today, attraction_id: params[:review][:attraction_id], user_id: params[:review][:user_id])
        if @review.save!
            redirect_to attraction_path(params[:review][:attraction_id])
        end
    end
end
