class SensorsController < ApplicationController
  before_action :set_sensor, only: [:show, :edit, :update, :destroy, :read]

  # GET /sensors
  # GET /sensors.json
  def index
    @sensors = Sensor.all
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /sensors/1
  # GET /sensors/1.json
  def show
  end

  # GET /sensors/new
  def new
    @sensor = Sensor.new
  end

  # GET /sensors/1/edit
  def edit
  end

  # POST /sensors
  # POST /sensors.json
  def create
    @sensor = Sensor.new(sensor_params)
    @snum = @sensor.number
    @spin = @sensor.pin
    @stype = @sensor.sensor_type
    if @stype == "DHT"
      eval("$sensor#{@snum}temp = Dino::Components::DHT::Temperature.new(pin: @spin, board: Gardino::Application.config.board)")
      eval("$sensor#{@snum}humidity = Dino::Components::DHT::Humidity.new(pin: @spin, board: Gardino::Application.config.board)")
    end
    respond_to do |format|
      if @sensor.save
        format.html { redirect_to @sensor, notice: 'Sensor was successfully created.' }
        format.json { render action: 'show', status: :created, location: @sensor }
      else
        format.html { render action: 'new' }
        format.json { render json: @sensor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sensors/1
  # PATCH/PUT /sensors/1.json
  def update
    respond_to do |format|
      if @sensor.update(sensor_params)
        format.html { redirect_to @sensor, notice: 'Sensor was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sensor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sensors/1
  # DELETE /sensors/1.json
  def destroy
    @sensor.destroy
    respond_to do |format|
      format.html { redirect_to sensors_url }
      format.json { head :no_content }
    end
  end

  # POST /sensors
  # POST /sensors.json
  def sensorread
    @sensor = Sensor.find(params[:id])
    @snum = @sensor.number
    @stype = @sensor.sensor_type
    if @stype == "DHT"
            
      eval("$sensor#{@snum}temp").read do |temperature|
        @stempread = "#{temperature}"
      end
      sleep 2
      eval("$sensor#{@snum}humidity").read do |humidity|
         @shumidityread = "#{humidity}"
      end
      @sensor.last_reading = "Temp:#{@stempread}C Humidity:#{@shumidityread}%"
      @sensor.save
    end
    @sensors = Sensor.all
    respond_to do |format|
      format.js
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sensor
      @sensor = Sensor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sensor_params
      params.require(:sensor).permit(:name, :sensor_type, :pin, :number, :last_reading, :description)
    end
end
