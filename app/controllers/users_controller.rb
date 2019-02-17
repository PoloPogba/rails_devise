class UsersController < ApplicationController
    before_action :authenticate_user!, only: [:users]
        
    def index 

    end

    def show
        #@id_user = User.find(current_user.id)
        @id_user = User.find(params[:id])
        if user_signed_in?
        @event = Event.where("admin_id = ?", current_user.id)
        
        end
end

    def index 

    end

end