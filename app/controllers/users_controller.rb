class UsersController < ApplicationController

    def index 

    end

    def show
        #@id_user = User.find(current_user.id)
        @id_user = User.find(params[:id])
        @event = Event.where("admin_id = ?", current_user.id)
    end

    def index 

    end

end