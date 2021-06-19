class PicsController < ApplicationController
    
    before_action :find_pic, only: [:show, :edit, :update, :destroy, :upvote]
    before_action :authenticate_user!, except: [:index, :show] #restricts user behaviour - index and show are only two actuions that someone not logged in can do
    
    def index
        @pics = Pic.all.order("created_at DESC") #decending order 
    end 
    
    def show
    end 
    
    def new #adds new images 
        # @pic = Pic.new #creates instance of Pic
        @pic = current_user.pics.build
    end 
    
    def create #saving it to database (structure) ** responsible for database changes 
        # @pic = Pic.new(pic_params)
        @pic = current_user.pics.build(pic_params)
        if @pic.save
            redirect_to @pic, notice: "Yes! It was posted!" #note that redirect is a page refresh unlike render 
        else
            render 'new' #using redirect_to will lose content on the page!
        end 
    end 
    
    def edit 
    end 
    
    def update # ** responsible for database changes 
        if @pic.update(pic_params)
            redirect_to @pic, notice: "Congrats! Pic was updated!"
        else
            render 'edit'
        end 
    end 
    
    def destroy
        @pic.destroy
        redirect_to root_path
    end 
    
    def upvote
        @pic.upvote_by current_user 
        redirect_back fallback_location: pics_path #to show page
    end 
    
    private #so it applies to other actions - DRY
    
    def pic_params
        params.require(:pic).permit(:title, :description, :image)
    end 
    
    def find_pic
        @pic = Pic.find(params[:id]) #allows @pic to be used in the view file 
    end 
    
end
