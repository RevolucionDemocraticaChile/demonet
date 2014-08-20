class MeetingGroupsController < ApplicationController
  before_action :set_meeting_group, only: [:show, :edit, :update, :destroy]

  authorize_resource

  def create
    @meeting_group = MeetingGroup.new(meeting_group_params)

    if @meeting_group.save
      flash[:success] = t(:association_created_successfully)
      redirect_to root_path
    else
      flash[:error] = t(:error_creating_association)
      redirect_to root_path
    end
  end

  def destroy
    @meeting_group.destroy
    flash[:success] = t(:association_destroyed_successfully)
    redirect_to root_path
  end

  private

    def set_meeting_group
      @meeting_group = MeetingGroup.find(params[:id])
    end

    def meeting_group_params
      params.require(:meeting_group).permit(:meeting_id, :group_id)
    end

end
