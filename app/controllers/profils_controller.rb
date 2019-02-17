class ProfilsController < ApplicationController
    def create
      @id_user = User.find(params[:user_id])
      @id_user.profil.attach(params[:profil])
      redirect_to(user_path(@id_user))
    end
  end