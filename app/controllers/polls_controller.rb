class PollsController < ApplicationController
  before_action :set_poll, only: [:show, :edit, :update, :destroy]

  authorize_resource

  def index
    @polls = Poll.all
  end

  def new
    @poll = Poll.new
  end

  def show
    @opinion = @poll.opinions.find_by(user_id: current_user.id)
    pre_data = @poll.opinions.group(:option).count
    @data = {}
    @poll.options.each_with_index { |option,i| @data[option] = pre_data[i] }
  end

  # POST /polls
  # POST /polls.json
  def create
    @poll = Poll.new(poll_params)

    if @poll.save
      flash[:success] = t(:poll_created_successfully)
      redirect_to @poll
    else
      render 'new'
    end
  end

  private

  def set_poll
    @poll = Poll.find(params[:id])
  end

  def poll_params
    params.require(:poll).permit(:name, :description, :start, :finish)
  end

end
