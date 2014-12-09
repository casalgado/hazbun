class ItemTypesController < ApplicationController
  def new
  end

  def create
    @item_type = ItemType.new(item_type_params)
    @item_type.save
    redirect_to settings_staticpages_path
  end

  def edit
  end

  def update
  end

  def destroy
    @item_type = ItemType.find(params[:id])
    @item_type.destroy
    redirect_to settings_staticpages_path
  end

  private

  def item_type_params
    params.require(:item_type).permit(:item_type)
  end
end
