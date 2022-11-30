class ReviewController < ApplicationController
    def new
        @review = Review.new
    end
    
    def create
        @review = Review.new(text: params[:review][:review], time: Date.today, attraction_id: params[:review][:attraction_id])#リンク追加必要
        if @review.save
            redirect_to attraction_path(params[:review][:attraction_id])
        else
            redirect_to attraction_path(params[:review][:attraction_id])
        end
    end
end
