class AttractionController < ApplicationController
    def index
        @attractions = Attraction.all
    end
end
