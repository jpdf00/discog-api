class GenresController < ApplicationController
  before_action :set_genre, only: %i[ show update destroy ]

  # GET /genres
  # GET /genres.json
  def index
    @genres = Genre.all
    authorize @genres
    render json: @genres, status: :ok
  end

  # GET /genres/1
  # GET /genres/1.json
  def show
    render json: @genre, status: :ok
  end

  # POST /genres
  # POST /genres.json
  def create
    @genre = Genre.new(genre_params)
    authorize @genre

    if @genre.save
      render json: @genre, status: :created
    else
      render json: @genre.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /genres/1
  # PATCH/PUT /genres/1.json
  def update
    if @genre.update(genre_params)
      render json: @genre, status: :ok
    else
      render json: @genre.errors, status: :unprocessable_entity
    end
  end

  # DELETE /genres/1
  # DELETE /genres/1.json
  def destroy
    @genre.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_genre
      @genre = Genre.find(params[:id])
      authorize @genre
    end

    # Only allow a list of trusted parameters through.
    def genre_params
      params.require(:genre).permit(:name)
    end
end
