class MemberGroupsController < ApplicationController
  before_action :set_member_group, only: [:show, :edit, :update, :destroy]

  authorize_resource

  def create
    @member_group = MemberGroup.new(member_group_params)

    respond_to do |format|
      if @member_group.save
        @success = true

        format.html do
          flash[:success] = t(:association_created_successfully)
          redirect_to root_path, notice: t(:association_created_successfully)
        end
        format.js { @original_controller = params[:original_controller] }
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
    @member_group.destroy

    respond_to do |format|
      format.html do
        flash[:success] = t(:association_destroyed_successfully)
        redirect_to root_path, notice: t(:association_destroyed_successfully)
      end
      format.js { @original_controller = params[:original_controller] }
    end
  end

  def mails
    @values = params[:data].split(',')
    @users_id = MemberGroup.where(:group_id => @values).map(&:user_id)
    @users = User.where(:id => @users_id).pluck(:email)
    respond_to do |format|
      format.json { render :json => @users}
    end
  end

  private

    def set_member_group
      @member_group = MemberGroup.find(params[:id])
    end

    def member_group_params
      params.require(:member_group).permit(:user_id, :group_id, :original_controller)
    end

end
