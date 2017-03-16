class PlayersController < ApplicationController
  before_action :set_player, only: [:show, :edit, :update, :destroy]

  # GET /players
  # GET /players.json
  def index
    @players = Player.all
  end

  # GET /players/1
  # GET /players/1.json
  def show
  end

  # GET /players/new
  def new
    @player = Player.new
  end

  # GET /players/1/edit
  def edit
  end

  # POST /players
  # POST /players.json
  def create
    plan_id = params[:player].delete(:plan_id)
    @player = Player.new(player_params)
    @player.plan = Plan.find(plan_id)

    respond_to do |format|
      if @player.save
        format.html { redirect_to @player, notice: 'Player was successfully created.' }
        format.json { render :show, status: :created, location: @player }
      else
        format.html { render :new }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /players/1
  # PATCH/PUT /players/1.json
  def update
    respond_to do |format|
      if @player.update(player_params)
        format.html { redirect_to @player, notice: 'Player was successfully updated.' }
        format.json { render :show, status: :ok, location: @player }
      else
        format.html { render :edit }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /players/1
  # DELETE /players/1.json
  def destroy
    @player.destroy
    respond_to do |format|
      format.html { redirect_to players_url, notice: 'Player was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_player
    @player = Player.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def player_params
    params.require(:player).permit(
      :name,
      :birthday,
      :cpf,
      :rg,
      :phones,
      :email,
      :address_street,
      :address_number,
      :address_complement,
      :address_neighborhood,
      :address_cep,
      :address_city,
      :address_state,
      :responsible_name,
      :responsible_cpf,
      :responsible_phones,
      :responsible_email,
      :sport_name,
      :headquarter,
      :conclusion_date,
      :travel_date,
      :signing_situation,
      :signing_value,
      :signing_payment_mode,
      :advisory_situation,
      :advisory_value,
      :advisory_payment_mode,
      :advisory_notes,
      :plan_end_date,
      :platform_payment_mode,
      :platform_payment_mode,
      :platform_parcels,
      :platform_notes,
      :active
    )
  end
end
