class PostcardsController < ApplicationController
  before_action :set_postcard, only: %i[show edit update destroy]

  def index
    @q = Postcard.ransack(params[:q])
    @postcards = @q.result(distinct: true).includes(:user,
                                                    :category).page(params[:page]).per(10)
  end

  def show; end

  def new
    @postcard = Postcard.new
  end

  def edit; end

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

  def update
    if @postcard.update(postcard_params)
      redirect_to @postcard, notice: "Postcard was successfully updated."
    else
      render :edit
    end
  end

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

  def set_postcard
    @postcard = Postcard.find(params[:id])
  end

  def postcard_params
    params.require(:postcard).permit(:postcard_image, :postcard_name,
                                     :description, :price, :delivery_time, :category_id, :bookmark_id, :user_id)
  end
end
