class EventsController < ApplicationController
    before_action :authenticate_user!, only: [:new]
    def index 
        @events = Event.all
    
    end

    def show 
        @id_event = Event.find(params[:id])
        
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
    
        if @event.save # essaie de sauvegarder en base @gossip
         
          redirect_to event_path(@event.id)
          
        else
           render :template => '/events/new'# sinon, il render la view new (qui est celle sur laquelle on est déjà)
        end
    end

    
    
end
