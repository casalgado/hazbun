class AbonosController < ApplicationController
  
  def new
    @abono = Abono.new
  end

  def create
    new_params = abono_params.clone
    new_params["fecha"] = abono_params["fecha"].change_date_format
    @abono = Abono.new(new_params)
    @abono.save
    redirect_to :back
  end

  def edit
  end

  def update
  end

  def show
  end

  def index
  end

  def destroy
  end

  private 

  def abono_params
    params.require(:abono).permit(:id, :orden_id, :fecha, :valor)
  end

end
