class GiftsController < ApplicationController
  before_action :set_gift, only: %i[show edit update destroy]

  def index
    @q = Gift.ransack(params[:q])
    @gifts = @q.result(distinct: true).includes(:wishes, :giftlists, :store,
                                                :category, :interested_friends, :wishers).page(params[:page]).per(10)
  end

  def show
    @giftlist = Giftlist.new
    @my_wish = MyWish.new
  end

  def new
    @gift = Gift.new
  end

  def edit; end

  def create
    @gift = Gift.new(gift_params)

    if @gift.save
      message = "Gift was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @gift, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @gift.update(gift_params)
      redirect_to @gift, notice: "Gift was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @gift.destroy
    message = "Gift was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to gifts_url, notice: message
    end
  end

  private

  def set_gift
    @gift = Gift.find(params[:id])
  end

  def gift_params
    params.require(:gift).permit(:gift_name, :description, :photo, :store_id,
                                 :category_id, :price, :website)
  end
end
