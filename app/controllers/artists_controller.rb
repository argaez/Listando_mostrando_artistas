class ArtistsController < ApplicationController

    before_action :set_artist, only: %i[show edit update destroy]

    def index
    
        @artists = Artist.all
       
    end

    def show

            
    end

    def new
    
        @artist = Artist.new
        @albums = Album.all
      
    end

    def create

        @artist = Artist.new(artist_params)
        if @artist.save
            redirect_to @artist
        else
            render :new
        end
    
    end

    def edit
        
        @albums = Album.all
                        
    end

    def update

        if @artist.update(artist_params)
            redirect_to artists_params
        else
            render :edit
        end
    end
    
    def destroy
    
        if @artist.destroy
        	flash[:success] = "Artist has been successfully deleted"
		else
			flash[:error] = "Artist could not be deleted"
        end
        
        redirect_to artists_path

    end
    

    private

    def artist_params

        params.require(:artist).permit(:name, :image_url)
    
    end

    def set_artist

        @artist = Artist.find(params[:id])
    
    end

end
