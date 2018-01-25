class ReservationsController < ApplicationController
  before_action :authenticate_user!, only: [:all, :edit, :update, :destroy]

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(safe_reservation_params)
    if @reservation.save
      UserMailer.email(@reservation).deliver
      redirect_to @reservation
    else
      render 'new'
    end
  end

  def update
    @reservation = Reservation.find(params[:id])
    @reservation.update(safe_reservation_params)
    redirect_to @reservation
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    respond_to do |format|
      format.html { redirect_to reservations_url }
      format.json { head :no_content }
    end
  end

  def all
    @reservations = Reservation.all
  end

  def index
    @reservations = Reservation.all
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def send_confirmation
    @reservation = Reservation.find(params[:id])
    if @reservation.email_sent
      render 'confirmation_already_sent'
    else
      UserMailer.confirmation_email(@reservation).deliver
      @reservation.email_sent = true
      @reservation.save
        render 'confirmation'
    end
  end

  def send_cancellation
    @reservation = Reservation.find(params[:id])

    if @reservation.email_sent == false
      render 'cancellation_already_sent'
    else
      UserMailer.cancellation_email(@reservation).deliver
      @reservation.email_sent = false
      @reservation.save
        render 'cancellation'
    end
  end

  private

  def safe_reservation_params
    params.require('reservation').permit(:date, :time, :guests, :name, :email, :phone, :requests)
  end
end
