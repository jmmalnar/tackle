class TicketsController < ApplicationController
  def index
    @tickets = Ticket.order("id desc").page(params[:page]).per(30)
    
    respond_to do |format|
      format.html
    end
  end  

end