class SongsController < ApplicationController

  before_action :set_song, only: [:show, :edit, :update, :destroy]

  def index
    @songs = Song.all
  end 

  def new
    @song = Song.new
  end 

  def create
    @song = Song.new(strong_params)
    if @song.save
      redirect_to song_path(@song)
    else
      render :new
    end 
  end 

  def show
    
  end

  def edit

  end 

  def update
    if @song.update(strong_params)
      redirect_to @song
    else
      render :edit
    end
  end 

  def destroy
    @song.destroy
    redirect_to songs_path
  end 

  private
    def set_song
      @song = Song.find_by_id(params[:id])
    end

    def strong_params
      params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
    end 


end
