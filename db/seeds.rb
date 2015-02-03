# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



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

Brand.create!(:first_name    => "Judy",
              :last_name     => "Habun",
              :brand_name    => "Judy Hazbun",
              :email         => "judy@hazbun.com",
              :password      => '12341234',
              :password_confirmation => '12341234')


Employee.create(:first_name    => "Empleado",
                :last_name     => "Judy",
                :brand_id      => 1,
                :email         => "judy@hazbun.com",
                :password      => '12341234',
                :password_confirmation => '12341234')

Employee.create(:first_name    => "Empleado",
                :last_name     => "Amalin",
                :brand_id      => 2,
                :email         => "amalin@hazbun.com",
                :password      => '12341234',
                :password_confirmation => '12341234')
                