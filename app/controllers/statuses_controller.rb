class StatusesController < ApplicationController
  before_action :set_status, only: %i[ show update destroy ]

  # GET /statuses
  # GET /statuses.json
  def index
    @statuses = Status.all.order_by_id
    authorize @statuses
    render json: @statuses, status: :ok
  end

  # GET /statuses/1
  # GET /statuses/1.json
  def show
    render json: @status, status: :ok
  end

  # POST /statuses
  # POST /statuses.json
  def create
    @status = Status.new(status_params)
    authorize @status

    if @status.save
      render json: @status, status: :created
    else
      render json: @status.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /statuses/1
  # PATCH/PUT /statuses/1.json
  def update
    if @status.update(status_params)
      render json: @status, status: :ok
    else
      render json: @status.errors, status: :unprocessable_entity
    end
  end

  # DELETE /statuses/1
  # DELETE /statuses/1.json
  def destroy
    @status.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_status
      @status = Status.find(params[:id])
      authorize @status
    end

    # Only allow a list of trusted parameters through.
    def status_params
      params.require(:status).permit(:name)
    end
end
