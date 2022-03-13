class PostcardsController < ApplicationController
  before_action :set_postcard, only: [:show, :edit, :update, :destroy]

  # GET /postcards
  def index
    @postcards = Postcard.all
  end

  # GET /postcards/1
  def show
  end

  # GET /postcards/new
  def new
    @postcard = Postcard.new
  end

  # GET /postcards/1/edit
  def edit
  end

  # POST /postcards
  def create
    @postcard = Postcard.new(postcard_params)

    if @postcard.save
      redirect_to @postcard, notice: 'Postcard was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /postcards/1
  def update
    if @postcard.update(postcard_params)
      redirect_to @postcard, notice: 'Postcard was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /postcards/1
  def destroy
    @postcard.destroy
    redirect_to postcards_url, notice: 'Postcard was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_postcard
      @postcard = Postcard.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def postcard_params
      params.require(:postcard).permit(:postcard_image, :postcard_name, :description, :price, :delivery_time, :category_id, :bookmark_id, :user_id)
    end
end
