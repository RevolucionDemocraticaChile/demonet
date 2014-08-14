class TerritoriosController < ApplicationController
	before_action :set_territorio, only: [:show, :edit, :update, :destroy]

	authorize_resource

	def index
		@territorios = Territorio.all
	end

	def new
		@territorio = Territorio.new
	end

	def show
	end

	def edit
	end

	private

		def set_territorio
			@territorio = Territorio.find(params[:id])
		end

end
