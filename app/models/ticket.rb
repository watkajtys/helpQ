class Ticket < ActiveRecord::Base
  belongs_to :user
  attr_accessible :description, :position
end
