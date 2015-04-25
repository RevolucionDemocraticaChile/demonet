class MeetingsController < ApplicationController

  before_action :set_meeting, only: [:show, :edit, :update, :destroy]

  authorize_resource

  def index
    @meetings = Meeting.all
  end

  def list
    @meetings = Meeting.includes(:user_meetings).order(date: :desc).limit(50)
  end

  def new
    @meeting = Meeting.new
    @users = User.select(:id, :email, :first_name, :last_name)
  end

  def create
    @meeting = Meeting.new(meeting_params)
    create_or_update
  end

  def show
  end

  def edit
    @users = User.select(:id, :email, :first_name, :last_name)
  end

  # PATCH/PUT /meetings/1
  def update
    @meeting.update(meeting_params)
    create_or_update
  end

  # DELETE /meetings/1
  def destroy
    @meeting.destroy
    flash[:success] = t(:meeting_destroyed_successfully)
    redirect_to meetings_url
  end

  private

    def create_or_update()

      if params["userMeeting"].nil?
        @meeting.errors.add(:asistente, " es necesario")
        render 'new'
      else
        if params["meetingGroup"].nil?
          @meeting.errors.add(:espacio, " es necesario")
          render 'new'
        else

          if @meeting.save
            UserMeeting.where(:meeting_id => @meeting.id).destroy_all
            params["userMeeting"]["users"].each do |user|
              admin_group = UserMeeting.new
              admin_group.user_id = user
              admin_group.meeting_id = @meeting.id
              admin_group.save
            end

            MeetingGroup.where(:meeting_id => @meeting.id).destroy_all
            params["meetingGroup"]["groups"].each do |group|
              member_group = MeetingGroup.new
              member_group.group_id = group
              member_group.meeting_id = @meeting.id
              member_group.save
            end

            flash[:success] = action_name == 'create' ? t(:meeting_created_successfully) : t(:meeting_updated_successfully)
            # redirect_to @group
            redirect_to @meeting
          else
            render 'new'
          end
        end
      end
    end

    def set_meeting
      @meeting = Meeting.find(params[:id])
    end

    def meeting_params
      params.require(:meeting).permit(:date, :desc, :start, :finish, :minutes)
    end

end
