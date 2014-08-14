class MemberTerritoriosController < ApplicationController
	before_action :set_territorio, only: [:show, :edit, :update, :destroy]

	authorize_resource

	def destroy
	end

	private

		def set_territorio
			@member_territorio = MemberTerritorio.find(params[:id])
			flash[:success] = "Usuario fue eliminado del Territorio."
			redirect_to root_path
		end

end
