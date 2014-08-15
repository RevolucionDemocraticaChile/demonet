class MemberTerritoriosController < ApplicationController
	before_action :set_territorio, only: [:show, :edit, :update, :destroy]

	authorize_resource

	def create
		@member_territorio = MemberTerritorio.new(member_territorio_params)

		if @member_territorio.save
			flash[:success] = "Asociación fue creada exitosamente."
			redirect_to root_path
		else
			flash[:error] = "Error."
			redirect_to root_path
		end
	end

	def destroy
		@member_territorio.destroy
		flash[:success] = "Asociación fue eliminada exitosamente."
		redirect_to root_path
	end

	private

		def set_territorio
			@member_territorio = MemberTerritorio.find(params[:id])
		end

		def member_territorio_params
			params.require(:member_territorio).permit(:user_id, :territorio_id)
		end

end
