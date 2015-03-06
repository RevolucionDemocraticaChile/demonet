class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  authorize_resource

  # GET /users
  def index
    @from = params['from'] || DateTime.now.to_date - 12.months
    @to =   params['to'] || DateTime.now.to_date
    @n =    params['n'] || 12
    @labels = ['default', 'primary', 'success', 'info', 'warning', 'danger']
    @users = User.includes(:groups, :agroups).all
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

    if current_user.agroups.any? || current_user.admin?
      render :edit_admin
    else
      render :edit
    end
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    if create_or_update
      flash[:success] = t(:user_created_successfully)
      redirect_to @user
    else
      render :new
    end
  end

  # PATCH/PUT /users/1
  def update
    if current_user.agroups.any? || current_user.admin?
      @user.assign_attributes(user_params_admin)
    else
      @user.assign_attributes(user_params)
    end

    if create_or_update
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


  def create_or_update
    if params["member_group"].nil? || params["member_group"]["groups"].empty?
      if @user.member_groups.empty?
        @user.errors.add(:espacio, " es necesario")
        return false
      end
    end

    success = false

    User.transaction do
      @user.save!

      if !params["member_group"].nil?
        MemberGroup.where(user_id: @user.id).destroy_all

        params["member_group"]["groups"].each do |group_id|
          member_group = MemberGroup.new(user_id: @user.id, group_id: group_id)
          member_group.save!
        end
      end

      success = true
    end

    return success
  end



  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:password, :password_confirmation, :rut, :birthdate, :city, :description, :mobile_number, :twitter_user, :display_name)
  end

  def user_params_admin
    params.require(:user).permit(:email, :first_name, :second_name, :last_name, :password, :password_confirmation, :rut, :birthdate, :city, :description, :mobile_number, :twitter_user, :active_member_until, :display_name)
  end

end
