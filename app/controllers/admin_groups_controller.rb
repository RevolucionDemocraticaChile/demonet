class AdminGroupsController < ApplicationController
  before_action :set_admin_group, only: [:show, :edit, :update, :destroy]

  authorize_resource

  def create
    @admin_group = AdminGroup.new(admin_group_params)

    # if @admin_group.save
    #   flash[:success] = t(:association_created_successfully)
    #   redirect_to root_path
    # else
    #   flash[:error] = t(:error_creating_association)
    #   redirect_to root_path
    # end

    respond_to do |format|
      if @admin_group.save
        @success = true

        format.html do
          flash[:success] = t(:association_created_successfully)
          redirect_to root_path, notice: t(:association_created_successfully)
        end
        format.js
      else
        @success = false

        format.html do
          flash[:error] = t(:error_creating_association)
          render :new
        end
        format.js
      end
    end
  end

  def destroy
    @admin_group.destroy

    respond_to do |format|
      format.html do
        flash[:success] = t(:association_destroyed_successfully)
        redirect_to root_path, notice: t(:association_destroyed_successfully)
      end
      format.js
    end
  end

  private

    def set_admin_group
      @admin_group = AdminGroup.find(params[:id])
    end

    def admin_group_params
      params.require(:admin_group).permit(:user_id, :group_id)
    end

end
