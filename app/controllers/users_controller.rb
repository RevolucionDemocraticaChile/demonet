class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  authorize_resource

  # GET /users
  def index
    @from = params['from'] || DateTime.now.to_date - 12.months
    @to = params['to'] || DateTime.now.to_date
    @n = params['n'] || 12
    @users = User.all
  end

  # GET /users/1
  def show
    @member_group = MemberGroup.new
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    authorize! :edit, @user, message: t(:not_authorized)
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = t(:user_created_successfully)
      redirect_to @user
    else
      render 'new'
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      flash[:success] = t(:user_updated_successfully)
      redirect_to @user
    else
      render :edit
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    flash[:success] = t(:user_destroyed_successfully)
    redirect_to users_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :first_name, :second_name, :last_name, :password, :password_confirmation, :rut)
    end

end
