class ItemsController < ApplicationController
  before_action :move_to_new, only: [:new, :create]

  def index
  end

  def new
      @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :description, :category_id, :condition_id, :charge_id, :source_id,
                                 :scheduled_delivery_id, :price).merge(user_id: current_user.id)
  end

  def move_to_new
    redirect_to new_user_session_path unless user_signed_in?
  end

end
