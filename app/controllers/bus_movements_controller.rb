class BusMovementsController < ApplicationController
  before_action :set_bus_movement, only: [:show, :edit, :update, :destroy]

  # GET /bus_movements
  # GET /bus_movements.json
  def index
    @bus_movements = BusMovement.all
  end

  # GET /bus_movements/1
  # GET /bus_movements/1.json
  def show
  end

  # GET /bus_movements/new
  def new
    @bus_movement = BusMovement.new
  end

  # GET /bus_movements/1/edit
  def edit
  end

  # POST /bus_movements
  # POST /bus_movements.json
  def create
    @bus_movement = BusMovement.new(bus_movement_params)

    respond_to do |format|
      if @bus_movement.save
        format.html { redirect_to @bus_movement, notice: 'Bus movement was successfully created.' }
        format.json { render action: 'show', status: :created, location: @bus_movement }
      else
        format.html { render action: 'new' }
        format.json { render json: @bus_movement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bus_movements/1
  # PATCH/PUT /bus_movements/1.json
  def update
    respond_to do |format|
      if @bus_movement.update(bus_movement_params)
        format.html { redirect_to @bus_movement, notice: 'Bus movement was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @bus_movement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bus_movements/1
  # DELETE /bus_movements/1.json
  def destroy
    @bus_movement.destroy
    respond_to do |format|
      format.html { redirect_to bus_movements_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bus_movement
      @bus_movement = BusMovement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bus_movement_params
      params[:bus_movement]
    end
end
