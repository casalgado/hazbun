class DefaultLoaders < ActiveRecord::Migration
  def up

    items = ['Vestido Corto', 'Vestido Largo', 'Blusa', 'Falda', 'Pantalon', 'Novia']
    items.each do |item|
      ItemType.find_or_create_by!(:item_type => item)
    end

    occasions = ['Grado', 'Matrimonio', 'Quinceañero', 'Coctel']
    occasions.each do |occasion|
      Occasion.find_or_create_by!(:occasion => occasion)
    end

    appointment_types = ['Primera', 'Medicion', 'Medicion Final', 'Entrega']
    appointment_types.each do |type|
      AppointmentType.find_or_create_by!(:appointment_type => type)
    end
    
    supply_names = ['chiffon', 'tafeta', 'seda', 'drill', 'lino']
    supply_names.each do |supply|
      Supply.find_or_create_by!(:supply_name => supply, :supply_color => 'azul', :supply_type => 'tela')
    end
  end

  def down
  end
end
