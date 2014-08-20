class UserMeetingsController < ApplicationController
  before_action :set_user_meeting, only: [:show, :edit, :update, :destroy]

  authorize_resource

  def create
    @user_meeting = UserMeeting.new(user_meeting_params)

    respond_to do |format|
      if @user_meeting.save
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
    @user_meeting.destroy

    respond_to do |format|
      format.html do
        flash[:success] = t(:association_destroyed_successfully)
        redirect_to root_path, notice: t(:association_destroyed_successfully)
      end
      format.js
    end
  end

  private

    def set_user_meeting
      @user_meeting = UserMeeting.find(params[:id])
    end

    def user_meeting_params
      params.require(:user_meeting).permit(:user_id, :meeting_id)
    end

end
