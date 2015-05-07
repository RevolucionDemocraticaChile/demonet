class OpinionsController < ApplicationController
  before_action :set_opinion, only: [:show, :edit, :update, :destroy]

  authorize_resource

  def index
    @opinions = Opinion.all
  end

  def new
    @poll = Poll.find(params[:poll_id])
    @opinion = Opinion.new
    if Opinion.where(poll_id: params[:poll_id], user_id: current_user.id).exists?
      flash[:error] = '¡Ya votaste!'
      redirect_to @poll
    end
  end

  # def show
  # end

  # POST /opinions
  # POST /opinions.json
  def create
    @opinion = Opinion.new(opinion_params)

    if @opinion.save
      flash[:success] = t(:opinion_created_successfully)
      redirect_to @opinion.poll
    else
      flash[:error] = t(:opinion_not_created)
      redirect_to @opinion.poll
    end
  end

  private

  def set_opinion
    @opinion = Opinion.find(params[:id])
  end

  def opinion_params
    params.require(:opinion).permit(:user_id, :poll_id, :option)
  end

end
