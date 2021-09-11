class BandsController < ApplicationController
  before_action :set_band, only: %i[ show update destroy ]

  # GET /bands
  # GET /bands.json
  def index
    @bands = Band.all
    autorize @bands
  end

  # GET /bands/1
  # GET /bands/1.json
  def show
  end

  # POST /bands
  # POST /bands.json
  def create
    @band = Band.new(band_params)
    autorize @band

    if @band.save
      render :show, status: :created, location: @band
    else
      render json: @band.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /bands/1
  # PATCH/PUT /bands/1.json
  def update
    if @band.update(band_params)
      render :show, status: :ok, location: @band
    else
      render json: @band.errors, status: :unprocessable_entity
    end
  end

  # DELETE /bands/1
  # DELETE /bands/1.json
  def destroy
    @band.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_band
      @band = Band.find(params[:id])
      autorize @band
    end

    # Only allow a list of trusted parameters through.
    def band_params
      params.require(:band).permit(:name, :genre_id, :status_id, :user_id)
    end
end
