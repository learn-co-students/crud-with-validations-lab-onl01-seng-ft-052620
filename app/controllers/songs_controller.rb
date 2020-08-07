class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end

  def new
    @song = Song.new
  end

  def edit
    @song = Song.find(params[:id])
  end

  def create
   @song = Song.new(song_params)

   if @song.save
     redirect song_path(@song)
   else
     render :new
   end
 end

 def update
  @song = Song.find(params[:id])

  if @song.update(song_params)
    redirect song_path(@song)
  else
    render :edit
  end
end

def destroy
  @song = Song.find(params[:id])
  @song.destroy
  redirect_to songs_url
end

private

def song_params
  params.require(:song).permit(
    :title, :release_year, :released, :genre, :artist_name
  )
end

end
