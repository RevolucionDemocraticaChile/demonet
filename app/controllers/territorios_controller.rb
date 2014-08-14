class TerritoriosController < ApplicationController
	before_action :set_territorio, only: [:show, :edit, :update, :destroy]

	authorize_resource

	def index
		@territorios = Territorio.all
	end

	def new
		@territorio = Territorio.new
	end

	def create
		@territorio = Territorio.new(territorio_params)

		if @territorio.save
			flash[:success] = "Territorio creado exitosamente."
			redirect_to @territorio
		else
			render 'new'
		end
	end

	def show
	end

	def edit
	end

	private

		def set_territorio
			@territorio = Territorio.find(params[:id])
		end

		def territorio_params
			params.require(:territorio).permit(:name)
		end

end
