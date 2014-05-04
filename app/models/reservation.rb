class Reservation < ActiveRecord::Base

	belongs_to :user
	validates :date, :time, :guests, :name, :email, :phone, presence: true
end
