class MemberTerritoriesController < ApplicationController

  before_action :set_member_territory, only: [:show, :edit, :update, :destroy]

  authorize_resource

  def create
    @member_territory = MemberTerritory.new(member_territory_params)

    if @member_territory.save
      flash[:success] = t(:association_created_successfully)
      redirect_to Territory.find_by(id: @member_territory.territory_id)
    else
      flash[:error] = t(:error_creating_association)
      redirect_to root_path
    end
  end

  def destroy
    @member_territory.destroy
    flash[:success] = t(:association_destroyed_successfully)
    redirect_to Territory.find_by(id: @member_territory.territory_id)
  end

  private

    def set_member_territory
      @member_territory = MemberTerritory.find(params[:id])
    end

    def member_territory_params
      params.require(:member_territory).permit(:user_id, :territory_id)
    end

end
