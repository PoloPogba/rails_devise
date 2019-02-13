class AttendancesController < ApplicationController

def index 

end

def show

end

def new
    @attendances = Attendance.last
    
end

def create 

        @attendance = Attendance.new
        @attendance.stripe_customer_id = $customer.id
        @attendance.event_id = $id_event.id
        @attendance.user_id = current_user.id

        
       
        if @attendance.save # essaie de sauvegarder en base @gossip
         
          redirect_to events_path
          
        else
           render :template => '/attendances/new'# sinon, il render la view new (qui est celle sur laquelle on est déjà)
        end
    
end

end
