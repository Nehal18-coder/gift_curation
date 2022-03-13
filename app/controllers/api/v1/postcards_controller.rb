class Api::V1::PostcardsController < Api::V1::GraphitiController
  def index
    postcards = PostcardResource.all(params)
    respond_with(postcards)
  end

  def show
    postcard = PostcardResource.find(params)
    respond_with(postcard)
  end

  def create
    postcard = PostcardResource.build(params)

    if postcard.save
      render jsonapi: postcard, status: :created
    else
      render jsonapi_errors: postcard
    end
  end

  def update
    postcard = PostcardResource.find(params)

    if postcard.update_attributes
      render jsonapi: postcard
    else
      render jsonapi_errors: postcard
    end
  end

  def destroy
    postcard = PostcardResource.find(params)

    if postcard.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: postcard
    end
  end
end
