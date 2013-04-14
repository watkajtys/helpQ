class AddedTicketReferencetoUSer < ActiveRecord::Migration
  def change
  	 change_table :users do |t|
    	t.references :tickets
    end
  end

  def down
  end
end
