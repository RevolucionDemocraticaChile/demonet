class UserActasController < ApplicationController
	before_action :set_territorio, only: [:show, :edit, :update, :destroy]

	authorize_resource

	def create
		@user_acta = UserActa.new(user_acta_params)

		if @user_acta.save
			flash[:success] = "Asociación fue creada exitosamente."
			redirect_to root_path
		else
			flash[:error] = "Error."
			redirect_to root_path
		end
	end

	def destroy
		@user_acta.destroy
		flash[:success] = "Asociación fue eliminada exitosamente."
		redirect_to root_path
	end

	private

		def set_user_acta
			@user_acta = UserActa.find(params[:id])
		end

		def user_acta_params
			params.require(:user_acta).permit(:user_id, :acta_id)
		end

end
