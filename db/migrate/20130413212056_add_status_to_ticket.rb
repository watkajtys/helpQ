class AddStatusToTicket < ActiveRecord::Migration
  def change
    change_table :tickets do |t|
    	t.boolean :status, :default => false
    end
    
  end
end
