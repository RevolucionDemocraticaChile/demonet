class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]

  authorize_resource

  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)

    if @group.save
      flash[:success] = t(:group_created_successfully)
      redirect_to @group
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  # DELETE /groups/1
  def destroy
    @group.destroy
    flash[:success] = t(:group_destroyed_successfully)
    redirect_to groups_url
  end

  private

    def set_group
      @group = Group.find(params[:id])
    end

    def group_params
      params.require(:group).permit(:name, :desc, :type)
    end

end
