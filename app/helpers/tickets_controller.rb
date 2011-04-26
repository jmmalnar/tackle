class TicketsController < ApplicationController
  def index
    @tickets = Ticket.all
    
    respond_to do |format|
      format.html
    end
  end
  
  def create
    @ticket = Ticket.new(params[:ticket])
    respond_to do |format|
      if @ticket.save
        format.html { redirect_to(tickets_path,
          :notice => 'Ticket was successfully created.') }
        else
          format.html { render :action => "new" }
        end
    end
  end

end
