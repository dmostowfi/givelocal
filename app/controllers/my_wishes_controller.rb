class MyWishesController < ApplicationController
  before_action :current_user_must_be_my_wish_user,
                only: %i[edit update destroy]

  before_action :set_my_wish, only: %i[show edit update destroy]

  def index
    @q = MyWish.ransack(params[:q])
    @my_wishes = @q.result(distinct: true).includes(:user,
                                                    :gift).page(params[:page]).per(10)
  end

  def show; end

  def new
    @my_wish = MyWish.new
  end

  def edit; end

  def create
    @my_wish = MyWish.new(my_wish_params)

    if @my_wish.save
      message = "MyWish was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @my_wish, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @my_wish.update(my_wish_params)
      redirect_to @my_wish, notice: "My wish was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @my_wish.destroy
    message = "MyWish was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to my_wishes_url, notice: message
    end
  end

  private

  def current_user_must_be_my_wish_user
    set_my_wish
    unless current_user == @my_wish.user
      redirect_back fallback_location: root_path,
                    alert: "You are not authorized for that."
    end
  end

  def set_my_wish
    @my_wish = MyWish.find(params[:id])
  end

  def my_wish_params
    params.require(:my_wish).permit(:user_id, :gift_id)
  end
end
