class ActasController < ApplicationController
	before_action :set_acta, only: [:show, :edit, :update, :destroy]

	authorize_resource

	def index
		@actas = Acta.all
	end

	def new
		@acta = Acta.new
	end

	def show
	end

	def create
		@acta = Acta.new(acta_params)

		if @acta.save
			flash[:success] = "Acta creada exitosamente"
			redirect_to @acta
		else
			render 'new'
		end
	end

	private

		def set_acta
			@acta = Acta.find(params[:id])
		end

		def acta_params
			params.require(:acta).permit(:date, :territorio_id, :summary)
		end

end
