class TerritoriesController < ApplicationController
  before_action :set_territory, only: [:show, :edit, :update, :destroy]

  authorize_resource

  def index
    @territories = Territory.all
  end

  def new
    @territory = Territory.new
  end

  def create
    @territory = Territory.new(territory_params)

    if @territory.save
      flash[:success] = "Territorio creado exitosamente."
      redirect_to @territory
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  private

    def set_territory
      @territory = Territory.find(params[:id])
    end

    def territory_params
      params.require(:territory).permit(:name)
    end

end
