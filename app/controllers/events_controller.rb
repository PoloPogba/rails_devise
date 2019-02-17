require "mini_magick"

class EventsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :edit]
    before_action :admin_event, only: [:edit]
    def index 
        @events = Event.all
    
    end

    def show 
        @id_event = Event.find(params[:id])
        @attendance = Attendance.find_by(event_id: params[:id], user_id: current_user.id)
        
       
    end

    def new 
        @event = Event.last
    end
    
    def create 
        @event = Event.new
        @event.title = params['event_title']
        @event.start_date = params['event_date']
        @event.duration = params['event_duration']
        @event.price = params['event_price']
        @event.location = params['event_location']
        @event.description = params['event_description']
        @event.admin_id = current_user.id
        @event.avatar.attach(params[:avatar])

        
                
                 
    
        if @event.save # essaie de sauvegarder en base @gossip
         
          redirect_to event_path(@event.id)
          
        else
           render :template => '/events/new'# sinon, il render la view new (qui est celle sur laquelle on est déjà)
        end
    end
    def edit 
        @id_event = Event.find(params['id'])
       end
      
       def update 
      
        @id_event = Event.find(params['id'])
       
            event_params = params.require(:event).permit(:title, :start_date, :price, :duration, :location, :description)
            @id_event.update(event_params)
           

            redirect_to events_path
       end
      
       def destroy 
        @id_event = Event.find(params['id'])
          if @id_event.destroy
            redirect_to events_path
          else
            redirect_to event_path(@id_event)
          end
        end

        def admin_event
            @id_event = Event.find(params['id'])
  
            if @id_event.admin_id != current_user.id
                redirect_to root_path, notice: "Sorry, but you are not allowed to access this page"
            end
        end
    
    
end
