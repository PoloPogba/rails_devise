class User < ApplicationRecord
    after_create :welcome_send
    
    def welcome_send
        UserMailer.welcome_email(self).deliver_now
      end

    validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" }
    validates :first_name, presence: true
    validates :last_name, presence: true
    has_many :attendances
    has_many :events, through: :attendances
    has_many :events, foreign_key: 'admin_id'



    


end
