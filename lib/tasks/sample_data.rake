require 'faker'

namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:drop'].invoke
    Rake::Task['db:migrate'].invoke
    Rake::Task['db:seed'].invoke



    judy = Brand.create!(:nombre    => "Judy",
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
      1.times do |order|
        order = clienta.orders.create!(:closed      => false,
                                       :total_value => 1000 + rand(1000))
        num_of_items = rand(2)+1

          num_of_items.times do |item|
          order.items.create!(:item_type_id => rand(5)+1, :occasion_id => rand(4)+1)
          end

        4.times do |appointment|
        day = rand(30) + 1
        time = 8 + rand(10)
        clienta.appointments.create!(:date     => Time.new(2014, 12, day, time, 00, 00),
                          :appointment_type_id => rand(4)+1)
        end
        
      end
    end



  end
end