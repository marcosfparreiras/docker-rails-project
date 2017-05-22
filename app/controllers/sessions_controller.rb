class SessionsController < ApplicationController
  skip_before_filter :require_login

  def new
  end

  def create
    email = params[:session][:email].downcase
    user = Admin.find_by(email: email) || Player.find_by(email: email)
    if user && user.authenticate(params[:session][:password])
      log_in user
      class_name = user.class.name
      redirect_to active_players_path if user.is_a?(Admin)
      redirect_to player_path(user.id) if user.is_a?(Player)
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
