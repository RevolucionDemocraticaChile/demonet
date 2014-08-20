class MemberGroupsController < ApplicationController
  before_action :set_member_group, only: [:show, :edit, :update, :destroy]

  authorize_resource

  def create
    @member_group = MemberGroup.new(member_group_params)

    if @member_group.save
      flash[:success] = t(:association_created_successfully)
      redirect_to root_path
    else
      flash[:error] = t(:error_creating_association)
      redirect_to root_path
    end
  end

  def destroy
    @member_group.destroy
    flash[:success] = t(:association_destroyed_successfully)
    redirect_to root_path
  end

  private

    def set_member_group
      @member_group = MemberGroup.find(params[:id])
    end

    def member_group_params
      params.require(:member_group).permit(:user_id, :group_id)
    end

end
