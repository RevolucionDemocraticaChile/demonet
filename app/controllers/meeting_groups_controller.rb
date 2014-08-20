class MeetingGroupsController < ApplicationController
  before_action :set_meeting_group, only: [:show, :edit, :update, :destroy]

  authorize_resource

  def create
    @meeting_group = MeetingGroup.new(meeting_group_params)

    # if @meeting_group.save
    #   flash[:success] = t(:association_created_successfully)
    #   redirect_to root_path
    # else
    #   flash[:error] = t(:error_creating_association)
    #   redirect_to root_path
    # end

    respond_to do |format|
      if @meeting_group.save
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
    @meeting_group.destroy

    respond_to do |format|
      format.html do
        flash[:success] = t(:association_destroyed_successfully)
        redirect_to root_path, notice: t(:association_destroyed_successfully)
      end
      format.js
    end
  end

  private

    def set_meeting_group
      @meeting_group = MeetingGroup.find(params[:id])
    end

    def meeting_group_params
      params.require(:meeting_group).permit(:meeting_id, :group_id)
    end

end
