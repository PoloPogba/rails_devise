class Event < ApplicationRecord
    
    validates :start_date, presence: true
    validate :test_start_date
    validates :duration, presence:true, numericality: { only_integer: true }
    validate :test_duration
    validates :title, presence: true, length: {minimum: 5, maximum: 140}
    validates :description, presence: true, length: {minimum: 20, maximum: 1000}
    validates :price, presence: true, numericality: { only_integer: true }, :inclusion => 1..1000
    validates :location, presence: true

    
    
    belongs_to :admin, class_name: "User"
    has_many :attendances
    has_many :users, through: :attendances




    

	def test_start_date
		if start_date.to_i < Time.now.to_i
			errors.add(:start_date, 'Your event cannot be in the past dude !')
		end
	end

	def test_duration
		unless duration % 5 == 0 && duration > 0
			errors.add(:duration, 'A positive multiple of 5 is required')
		end
    end
    
   


end
