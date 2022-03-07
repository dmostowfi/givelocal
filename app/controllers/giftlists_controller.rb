class GiftlistsController < ApplicationController
  before_action :set_giftlist, only: [:show, :edit, :update, :destroy]

  # GET /giftlists
  def index
    @giftlists = Giftlist.all
  end

  # GET /giftlists/1
  def show
  end

  # GET /giftlists/new
  def new
    @giftlist = Giftlist.new
  end

  # GET /giftlists/1/edit
  def edit
  end

  # POST /giftlists
  def create
    @giftlist = Giftlist.new(giftlist_params)

    if @giftlist.save
      redirect_to @giftlist, notice: 'Giftlist was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /giftlists/1
  def update
    if @giftlist.update(giftlist_params)
      redirect_to @giftlist, notice: 'Giftlist was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /giftlists/1
  def destroy
    @giftlist.destroy
    redirect_to giftlists_url, notice: 'Giftlist was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_giftlist
      @giftlist = Giftlist.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def giftlist_params
      params.require(:giftlist).permit(:user_id, :friend_name, :gift_id)
    end
end
