class AddEmailSentToReservation < ActiveRecord::Migration
  def change
    add_column :reservations, :email_sent, :boolean
  end
end
