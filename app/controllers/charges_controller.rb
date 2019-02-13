class ChargesController < ApplicationController

  
    def new
    #@event_id = Event.find($event_id)
    
    $id_event = Event.find(params[:event_id])
    $amount = $id_event.price
    end
    
    def create
      # Amount in cents
      #@id_event = Event.find(params[:event_id])
      #@amount = @id_event.price
    
      $customer = Stripe::Customer.create(
        :email => params[:stripeEmail],
        :source  => params[:stripeToken]
      )
    
      charge = Stripe::Charge.create(
        :customer    => $customer.id,
        :amount      => $amount* 100,
        :description => 'Price Event',
        :currency    => 'usd'
      )
    
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
    end
end
