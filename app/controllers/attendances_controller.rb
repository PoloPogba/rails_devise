class AttendancesController < ApplicationController

def index 

end

def show
  @users = User.all
  @id_event = Event.find(params[:event_id])
  @attendance = Attendance.find_by(event_id: params[:id], user_id: current_user.id)
end

def new
  @id_event = Event.find(params[:event_id])
 
    
end

def create 
  @id_event = Event.find(params[:event_id])
  @amount = @id_event.price * 100
 
  customer = Stripe::Customer.create(
        :email => params[:stripeEmail],
        :source  => params[:stripeToken]
      )
    
      charge = Stripe::Charge.create(
        :customer    => customer.id,
        :amount      => @amount ,
        :description => 'Price Event',
        :currency    => 'usd'
      )
    
  

        @attendance = Attendance.new
        @attendance.stripe_customer_id = customer.id
        @attendance.event_id = @id_event.id
        @attendance.user_id = current_user.id
        
         
        if @attendance.save   
          redirect_to event_path(params[:event_id])
        end

          
        
        
      rescue Stripe::CardError => e
        flash[:error] = e.message
        redirect_to event_attendances_path(params[:event_id])
         
  end
 
end
