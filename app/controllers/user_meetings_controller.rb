class UserMeetingsController < ApplicationController
  before_action :set_territory, only: [:show, :edit, :update, :destroy]

  authorize_resource

  def create
    @user_meeting = UserMeeting.new(user_meeting_params)

    if @user_meeting.save
      flash[:success] = "Asociación fue creada exitosamente."
      redirect_to root_path
    else
      flash[:error] = "Error."
      redirect_to root_path
    end
  end

  def destroy
    @user_meeting.destroy
    flash[:success] = "Asociación fue eliminada exitosamente."
    redirect_to root_path
  end

  private

    def set_user_meeting
      @user_meeting = UserMeeting.find(params[:id])
    end

    def user_meeting_params
      params.require(:user_meeting).permit(:user_id, :meeting_id)
    end

end
