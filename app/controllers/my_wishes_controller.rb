class MyWishesController < ApplicationController
  before_action :set_my_wish, only: [:show, :edit, :update, :destroy]

  # GET /my_wishes
  def index
    @my_wishes = MyWish.all
  end

  # GET /my_wishes/1
  def show
  end

  # GET /my_wishes/new
  def new
    @my_wish = MyWish.new
  end

  # GET /my_wishes/1/edit
  def edit
  end

  # POST /my_wishes
  def create
    @my_wish = MyWish.new(my_wish_params)

    if @my_wish.save
      redirect_to @my_wish, notice: 'My wish was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /my_wishes/1
  def update
    if @my_wish.update(my_wish_params)
      redirect_to @my_wish, notice: 'My wish was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /my_wishes/1
  def destroy
    @my_wish.destroy
    message = "MyWish was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to my_wishes_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_my_wish
      @my_wish = MyWish.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def my_wish_params
      params.require(:my_wish).permit(:user_id, :gift_id)
    end
end
