class OccasionsController < ApplicationController
  def new
  end

  def create
    @occasion = Occasion.new(occasion_params)
    @occasion.save
    redirect_to settings_staticpages_path
  end

  def edit
  end

  def update
  end

  def destroy
    @occasion = Occasion.find(params[:id])
    @occasion.destroy
    redirect_to settings_staticpages_path
  end

  private 

  def occasion_params
    params.require(:occasion).permit(:occasion)
  end
end
