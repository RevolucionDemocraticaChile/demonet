class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]

  authorize_resource

  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
    # @group.admin_groups = AdminGroup.new
  end

  def create
    @group = Group.new(group_params)
    create_or_update
  end

  def show
  end

  def edit
  end

  def update
    @group.name = group_params['name']
    @group.type = group_params['type']
    create_or_update
  end

  # DELETE /groups/1
  def destroy
    @group.destroy
    flash[:success] = t(:group_destroyed_successfully)
    redirect_to groups_url
  end

  private

    def create_or_update()

      if params["adminGroup"].nil?
        @group.errors.add(:moderador, " es necesario")
        render 'new'
      else
        if params["memberGroup"].nil?
          @group.errors.add(:miembro, " es necesario")
          render 'new'
        else

          if @group.save
            AdminGroup.where(:group_id => @group.id).destroy_all
            params["adminGroup"]["users"].each do |user|
              admin_group = AdminGroup.new
              admin_group.user_id = user
              admin_group.group_id = @group.id
              admin_group.save
            end

            MemberGroup.where(:group_id => @group.id).destroy_all
            params["memberGroup"]["users"].each do |user|
              member_group = MemberGroup.new
              member_group.user_id = user
              member_group.group_id = @group.id
              member_group.save
            end

            flash[:success] = action_name == 'create' ? t(:group_created_successfully) : t(:group_updated_successfully)
            # redirect_to @group
            redirect_to groups_url
          else
            render 'new'
          end
        end
      end
    end

    def set_group
      @group = Group.find(params[:id])
    end

    def group_params
      params.require(:group).permit(:name, :desc, :type)
    end

end
