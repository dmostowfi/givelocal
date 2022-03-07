class Api::V1::MyWishesController < Api::V1::GraphitiController
  def index
    my_wishes = MyWishResource.all(params)
    respond_with(my_wishes)
  end

  def show
    my_wish = MyWishResource.find(params)
    respond_with(my_wish)
  end

  def create
    my_wish = MyWishResource.build(params)

    if my_wish.save
      render jsonapi: my_wish, status: :created
    else
      render jsonapi_errors: my_wish
    end
  end

  def update
    my_wish = MyWishResource.find(params)

    if my_wish.update_attributes
      render jsonapi: my_wish
    else
      render jsonapi_errors: my_wish
    end
  end

  def destroy
    my_wish = MyWishResource.find(params)

    if my_wish.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: my_wish
    end
  end
end
