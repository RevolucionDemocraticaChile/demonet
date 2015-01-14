class PasswordResetsController < ApplicationController
  layout false
  skip_authorization_check
  skip_before_filter :check_session

  before_action :get_user,   only: [:edit, :update]
  before_action :valid_user, only: [:edit, :update]
  before_action :check_expiration, only: [:edit, :update]

  def new
  end

  def create
    @user = User.find_by(email: params[:password_reset][:email].downcase)
    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
      flash[:info] = t(:email_password_recovery)
      redirect_to ingresar_path
    else
      flash.now[:danger] = t(:email_not_found)
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      sign_in @user
      flash[:success] = t(:password_reset)
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

    def user_params
      params.require(:user).permit(:password, :password_confirmation)
    end

    def password_blank?
      params[:user][:password].blank?
    end

    # filters
    def get_user
      @user = User.find_by(email: params[:email])
    end

    def valid_user
      # unless (@user && @user.authenticated_reset?(params[:id]))
      #   redirect_to root_url
      # end
    end

    def check_expiration
      if @user.password_reset_expired?
        flash[:danger] = t(:password_expired)
        redirect_to new_password_reset_url
      end
    end
end
