class SessionsController < ApplicationController

  skip_before_filter :check_session, only: [:new, :create]

  skip_authorization_check

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)

    if user && user.authenticate(params[:session][:password])
      # Sign in and redirect to user show
      flash[:success] = 'Has ingresado exitosamente.'
      sign_in user
      redirect_to user
    else
      flash.now[:error] = 'Combinación email/contraseña invalida'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to ingresar_path
  end

end
