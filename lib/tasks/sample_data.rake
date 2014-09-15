require 'faker'

namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke

    judy = Marca.create!(:nombre    => "Judy",
                         :apellido  => "Habun",
                         :marca     => "Judy Hazbun",
                         :email     => "judy@hazbun.com",
                         :password  => '12341234',
                         :password_confirmation => '12341234')

    10.times do |n|
      nombre   = Faker::Name.first_name
      apellido = Faker::Name.last_name
      email    = Faker::Internet.email
      password = '12341234'
      password_confirmation = '12341234'

      judy.clientas.create!(:nombre    => nombre,
                            :apellido  => apellido,
                            :email     => email,
                            :password  => password,
                            :password_confirmation => password_confirmation)
    end
      
    judy.clientas.each do |clienta|
      3.times do |orden|
        orden = clienta.ordenes.create!(:abierta     => false,
                                        :valor_total => 1000 + rand(1000))
        4.times do |cita|
        day = rand(20) + 1
        time = 8 + rand(10)
        orden.citas.create!(:fecha           => Time.new(2014, 9, day, time, 00, 00),
                            :tipo_de_cita_id => rand(3)+1)
        end
      end
    end

  end
end