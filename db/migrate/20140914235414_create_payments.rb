class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
			t.belongs_to :order
			t.datetime   :date
			t.integer    :amount

      t.timestamps
    end
  end
end
