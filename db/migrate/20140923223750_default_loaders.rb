class DefaultLoaders < ActiveRecord::Migration
  def up
  	ItemType.load
  	Occasion.load
  	AppointmentType.load
  end

  def down
  	ItemType.destroy_all
  	Occasion.destroy_all
  	AppointmentType.destroy_all
  end
end
