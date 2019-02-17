class AvatarsController < ApplicationController
    def create
      @id_event = Event.find(params[:event_id])
      @id_event.avatar.attach(params[:avatar])
      redirect_to(event_path(@id_event))
    end

    
  end