class SessionsController < ApplicationController

	# skip_before_filter :check_session, only: [:new, :create]

	def new
	end

	def create
		user = User.find_by(email: params[:session][:email].downcase)

		if user && user.authenticate(params[:session][:password])
			# Sign in and redirect to user show
			flash[:success] = 'User successfully signed in.'
			sign_in user
			redirect_to user
		else
			flash.now[:error] = 'Invalid email/password combination'
			render 'new'
		end
	end

	def destroy
		sign_out
		redirect_to signin_path
	end
end
