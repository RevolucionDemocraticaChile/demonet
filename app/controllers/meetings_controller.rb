class MeetingsController < ApplicationController
	before_action :set_meeting, only: [:show, :edit, :update, :destroy]

	authorize_resource

	def index
		@meetings = Meeting.all
	end

	def new
		@meeting = Meeting.new
	end

	def show
	end

	def create
		@meeting = Meeting.new(meeting_params)

		if @meeting.save
			flash[:success] = "Meeting creada exitosamente"
			redirect_to @meeting
		else
			render 'new'
		end
	end

	private

		def set_meeting
			@meeting = Meeting.find(params[:id])
		end

		def meeting_params
			params.require(:meeting).permit(:date, :territory_id, :summary)
		end

end
