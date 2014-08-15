class ActasController < ApplicationController
	before_action :set_acta, only: [:show, :edit, :update, :destroy]

	authorize_resource

	def new
		@acta = Acta.new
	end

	private

end
