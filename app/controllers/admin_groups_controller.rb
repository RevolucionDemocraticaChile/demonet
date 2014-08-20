class AdminGroupsController < ApplicationController
  before_action :set_admin_group, only: [:show, :edit, :update, :destroy]

  authorize_resource

  def create
    @admin_group = AdminGroup.new(admin_group_params)

    if @admin_group.save
      flash[:success] = t(:association_created_successfully)
      redirect_to root_path
    else
      flash[:error] = t(:error_creating_association)
      redirect_to root_path
    end
  end

  def destroy
    @admin_group.destroy
    flash[:success] = t(:association_destroyed_successfully)
    redirect_to root_path
  end

  private

    def set_admin_group
      @admin_group = AdminGroup.find(params[:id])
    end

    def admin_group_params
      params.require(:admin_group).permit(:user_id, :group_id)
    end

end
