class AlbumsController < ApplicationController

    before_action :set_album, only: %i[show edit update destroy]

    def index
    
        @albums = Album.all

    end

    def show

            
    end

    def new
    
        @album = Album.new

    end

    def create

        @album = Album.new(album_params)
        if @album.save
            redirect_to @album
        else
            render :new
        end
    
    end

    def edit
    
                
    end

    def update

        if @album.update(album_params)
            redirect_to albums_params
        else
            render :edit
        end
    end
    
    def destroy
    
        if @album.destroy
        	flash[:success] = "Album has been successfully deleted"
		else
			flash[:error] = "Album could have not be deleted"
        end
        
        redirect_to albums_path

    end
    

    private

    def album_params

        params.require(:album).permit(:name, :image_url, :released_at)
    
    end

    def set_album

        @album = Album.find(params[:id])
    
    end


end
