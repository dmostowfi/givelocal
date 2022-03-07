class Api::V1::GiftlistsController < Api::V1::GraphitiController
  def index
    giftlists = GiftlistResource.all(params)
    respond_with(giftlists)
  end

  def show
    giftlist = GiftlistResource.find(params)
    respond_with(giftlist)
  end

  def create
    giftlist = GiftlistResource.build(params)

    if giftlist.save
      render jsonapi: giftlist, status: 201
    else
      render jsonapi_errors: giftlist
    end
  end

  def update
    giftlist = GiftlistResource.find(params)

    if giftlist.update_attributes
      render jsonapi: giftlist
    else
      render jsonapi_errors: giftlist
    end
  end

  def destroy
    giftlist = GiftlistResource.find(params)

    if giftlist.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: giftlist
    end
  end
end
