class GiftlistsController < ApplicationController
  before_action :set_giftlist, only: %i[show edit update destroy]

  def index
    @q = Giftlist.ransack(params[:q])
    @giftlists = @q.result(distinct: true).includes(:user,
                                                    :gift).page(params[:page]).per(10)
  end

  def show; end

  def new
    @giftlist = Giftlist.new
  end

  def edit; end

  def create
    @giftlist = Giftlist.new(giftlist_params)

    if @giftlist.save
      message = "Giftlist was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @giftlist, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @giftlist.update(giftlist_params)
      redirect_to @giftlist, notice: "Giftlist was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @giftlist.destroy
    message = "Giftlist was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to giftlists_url, notice: message
    end
  end

  private

  def set_giftlist
    @giftlist = Giftlist.find(params[:id])
  end

  def giftlist_params
    params.require(:giftlist).permit(:user_id, :friend_name, :gift_id)
  end
end
