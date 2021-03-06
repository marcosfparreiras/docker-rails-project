class PlayersController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: [:activate, :deactivate]
  skip_before_filter :require_login, only: [:activate, :deactivate]
  before_action :set_player, only: [:show, :edit, :update, :destroy, :activate, :deactivate]

  def status
    @player = Player.find(params[:id])
    @headers = %w(Status Item Details Deadline Date\ Completed)
  end

  def active
    @players = Player.active
  end

  def inactive
    @players = Player.inactive
  end

  def activate
    @player.activate
    respond_to do |format|
      format.js
    end
  end

  def deactivate
    @player.deactivate
    respond_to do |format|
      format.js
    end
  end

  def items
    @player = Player.find(params[:id])
    @items = @player.items
  end

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
    travel_date_year = params[:player].delete(:travel_date_year)
    travel_date_season = params[:player].delete(:travel_date_season)
    @player = Player.new(player_params)
    @player.plan = Plan.find(plan_id)
    @player.travel_date = "#{travel_date_season}/#{travel_date_year}"
    @player.password = params[:player][:email]

    respond_to do |format|
      if @player.save
        format.html { redirect_to active_players_path, notice: 'Player was successfully created.' }
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
