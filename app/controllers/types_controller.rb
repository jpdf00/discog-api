class TypesController < ApplicationController
  before_action :set_type, only: %i[ show update destroy ]

  # GET /types
  # GET /types.json
  def index
    @types = Type.all
    autorize @types
  end

  # GET /types/1
  # GET /types/1.json
  def show
  end

  # POST /types
  # POST /types.json
  def create
    @type = Type.new(type_params)
    autorize @type

    if @type.save
      render :show, status: :created, location: @type
    else
      render json: @type.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /types/1
  # PATCH/PUT /types/1.json
  def update
    if @type.update(type_params)
      render :show, status: :ok, location: @type
    else
      render json: @type.errors, status: :unprocessable_entity
    end
  end

  # DELETE /types/1
  # DELETE /types/1.json
  def destroy
    @type.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_type
      @type = Type.find(params[:id])
      autorize @type
    end

    # Only allow a list of trusted parameters through.
    def type_params
      params.require(:type).permit(:name)
    end
end
