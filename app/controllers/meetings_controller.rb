class MeetingsController < ApplicationController

  before_action :set_meeting, only: [:show, :edit, :update, :destroy]

  authorize_resource

  def index
    @meetings = Meeting.all
  end

  def new
    @meeting = Meeting.new
  end

  def create
    @meeting = Meeting.new(meeting_params)

    if @meeting.save
      flash[:success] = t(:meeting_created_successfully)
      redirect_to @meeting
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  # PATCH/PUT /meetings/1
  def update
    if @meeting.update(meeting_params)
      flash[:success] = t(:meeting_updated_successfully)
      redirect_to @meeting
    else
      render :edit
    end
  end

  # DELETE /meetings/1
  def destroy
    @meeting.destroy
    flash[:success] = t(:meeting_destroyed_successfully)
    redirect_to meetings_url
  end

  private

    def set_meeting
      @meeting = Meeting.find(params[:id])
    end

    def meeting_params
      params.require(:meeting).permit(:date, :desc, :group_id)
    end

end
