class RelaysController < ApplicationController
  before_action :set_relay, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token
  # GET /relays
  # GET /relays.json
  def index
    @relays = Relay.all
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /relays/1
  # GET /relays/1.json
  def show
  end

  # GET /relays/new
  def new
    @relay = Relay.new
  end

  # GET /relays/1/edit
  def edit
  end

  # POST /relays
  # POST /relays.json
  def create
    @relay = Relay.new(relay_params)

    respond_to do |format|
      if @relay.save
        format.html { redirect_to @relay, notice: 'Relay was successfully created.' }
        format.json { render action: 'show', status: :created, location: @relay }
      else
        format.html { render action: 'new' }
        format.json { render json: @relay.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /relays/1
  # PATCH/PUT /relays/1.json
  def update
    respond_to do |format|
      if @relay.update(relay_params)
        format.html { redirect_to @relay, notice: 'Relay was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @relay.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /relays/1
  # DELETE /relays/1.json
  def destroy
    @relay.destroy
    respond_to do |format|
      format.html { redirect_to relays_url }
      format.json { head :no_content }
    end
  end

  # POST /relays
  # POST /relays.json
  def turnoff
    @relay = Relay.find(params[:id])
    @relayn = @relay.number
    @relayh = eval("$relay#{@relayn}")
    @relayh.off
    @relay.status="off"
    @relay.save
    @relays = Relay.all
    respond_to do |format|
      format.js
    end
  end

  # POST /relays
  # POST /relays.json
  def turnon
    @relay = Relay.find(params[:id])
    @relayn = @relay.number
    @relayh = eval("$relay#{@relayn}")
    @relayh.on
    @relay.status="on"
    @relay.save
    @relays = Relay.all
    respond_to do |format|
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_relay
      @relay = Relay.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def relay_params
      params.require(:relay).permit(:name, :pin, :number, :status)
    end
end
