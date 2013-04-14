class Ticket < ActiveRecord::Base
  belongs_to :user
  attr_accessible :description, :position

  scope :latest, order('created_at DESC')
end
