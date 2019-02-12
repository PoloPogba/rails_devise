class Attendance < ApplicationRecord
    validates :stripe_customer_id, uniqueness: true
belongs_to :user
belongs_to :event

after_create :new_attende_send

	def new_attende_send
		UserMailer.new_attende(self).deliver_now
	end

end
