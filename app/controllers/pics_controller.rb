class PicsController < ApplicationController
    def index
    end 
    
    def new #adds new images 
        @pic = Pic.new 
    end 
    
    def create #saving it to database
        @pic = Pic.new(pic_params)
    end 
    
    private
    
    def pic_params
        params.require(:pic).permit(:title, :description)
    end 
    
end
