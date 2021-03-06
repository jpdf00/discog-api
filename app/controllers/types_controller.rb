class TypesController < ApplicationController
  before_action :set_type, only: %i[ show update destroy ]

  # GET /types
  # GET /types.json
  def index
    @types = Type.all.order_by_name
    authorize @types
    render json: @types, status: :ok
  end

  # GET /types/1
  # GET /types/1.json
  def show
    render json: @type, status: :ok
  end

  # POST /types
  # POST /types.json
  def create
    @type = Type.new(type_params)
    authorize @type

    if @type.save
      render json: @type, status: :created
    else
      render json: @type.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /types/1
  # PATCH/PUT /types/1.json
  def update
    if @type.update(type_params)
      render json: @type, status: :ok
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
      authorize @type
    end

    # Only allow a list of trusted parameters through.
    def type_params
      params.require(:type).permit(:name)
    end
end
