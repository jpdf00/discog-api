class AlbumsController < ApplicationController
  before_action :set_album, only: %i[ show update destroy ]

  # GET /albums
  # GET /albums.json
  def index
    @albums = Album.where({ band_id: params[:band_id] }).includes(:band, :type)
    authorize @albums
    render json: @albums, status: :ok
  end

  # GET /albums/1
  # GET /albums/1.json
  def show
    render json: @album, status: :ok
  end

  # POST /albums
  # POST /albums.json
  def create
    @album = Album.new(album_params)
    authorize @album

    if @album.save
      render json: @album, status: :created
    else
      render json: @album.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /albums/1
  # PATCH/PUT /albums/1.json
  def update
    if @album.update(album_params)
      render json: @album, status: :ok
    else
      render json: @album.errors, status: :unprocessable_entity
    end
  end

  # DELETE /albums/1
  # DELETE /albums/1.json
  def destroy
    @album.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_album
      @album = Album.find(params[:id])
      authorize @album
    end

    # Only allow a list of trusted parameters through.
    def album_params
      params.require(:album).permit(:name, :year, :qtd_songs, :size, :cover, :band_id, :type_id)
    end
end
