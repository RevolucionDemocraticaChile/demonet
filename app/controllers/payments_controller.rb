class PaymentsController < ApplicationController
  before_action :set_payment, only: [:show, :edit, :update, :destroy]

  authorize_resource

  def index
    @payments = Payment.all
  end

  def new
    @payment = Payment.new
    @users = User.all
  end

  # GET /payments/1/edit
  def edit
    authorize! :edit, @payment, message: t(:not_authorized)
  end

  # POST /payments
  # POST /payments.json
  def create
    @payment = Payment.new(payment_params)

    if @payment.save
      flash[:success] = t(:payment_created_successfully)
      redirect_to @payment
    else
      @users = User.all
      render 'new'
    end
  end

  def show
  end

  def edit
    @users = User.all
  end

  # PATCH/PUT /payments/1
  def update
    if @payment.update(payment_params)
      flash[:success] = t(:payment_updated_successfully)
      redirect_to @payment
    else
      render :edit
    end
  end

  # DELETE /payment/1
  def destroy
    @payment.destroy
    flash[:success] = t(:payment_destroyed_successfully)
    redirect_to payments_url
  end

  private

  def set_payment
    @payment = Payment.find(params[:id])
  end

  def payment_params
    params.require(:payment).permit(:user_id, :amount, :date, :description)
  end

end
