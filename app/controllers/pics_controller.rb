class PicsController < ApplicationController
    
    before_action :find_pic, only: [:show, :edit, :update, :destroy]
    def index
    end 
    
    def show
    end 
    
    def new #adds new images 
        @pic = Pic.new #creates instance of Pic
    end 
    
    def create #saving it to database (structure)
        @pic = Pic.new(pic_params)
        
        if @pic.save
            redirect_to @pic, notice: "Yes! It was posted!"
        else
            render 'new'
        end 
    end 
    
    private #so it applies to other actions - DRY
    
    def pic_params
        params.require(:pic).permit(:title, :description)
    end 
    
    def find_pic
        @pic = Pic.find(params[:id])
    end 
    
end
