class PostcardsController < ApplicationController
  before_action :set_postcard, only: %i[show edit update destroy]

  # GET /postcards
  def index
    @q = Postcard.ransack(params[:q])
    @postcards = @q.result(distinct: true).includes(:user,
                                                    :category).page(params[:page]).per(10)
  end

  # GET /postcards/1
  def show; end

  # GET /postcards/new
  def new
    @postcard = Postcard.new
  end

  # GET /postcards/1/edit
  def edit; end

  # POST /postcards
  def create
    @postcard = Postcard.new(postcard_params)

    if @postcard.save
      message = "Postcard was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @postcard, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /postcards/1
  def update
    if @postcard.update(postcard_params)
      redirect_to @postcard, notice: "Postcard was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /postcards/1
  def destroy
    @postcard.destroy
    message = "Postcard was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to postcards_url, notice: message
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_postcard
    @postcard = Postcard.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def postcard_params
    params.require(:postcard).permit(:postcard_image, :postcard_name,
                                     :description, :price, :delivery_time, :category_id, :bookmark_id, :user_id)
  end
end
