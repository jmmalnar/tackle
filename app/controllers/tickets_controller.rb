class TicketsController < ApplicationController
  def index
    @tickets = Ticket.order("id desc").page(params[:page]).per(30)
    
    respond_to do |format|
      format.html
    end
  end  
  
  def create
    @ticket = Ticket.new(params[:ticket])
    @ticket.type = params[:type]
    respond_to do |format|
      if @ticket.save
          format.html { redirect_to(tickets_path,
                      :notice => "#{@ticket.type} was successfully created.") }
        else
          format.html { redirect_to(new_ticket_path(:type => @ticket.type)) }
        end
    end
  end
  
  def edit
    @ticket = Ticket.find_by_id(params[:id])
  end
  
  def update
    @ticket = Ticket.find_by_id(params[:id])
    respond_to do |format|
      if ticket_is_successfully_updated
        @ticket.send(params[:event][:fire])
        format.html { redirect_to(tickets_path,
                      :notice => "#{@ticket.type} was successfully updated.") }
      else
        format.html { render :action => "edit" }
      end
    end
  end
  
  private
  def ticket_is_successfully_updated
    @ticket.state_events.include?(params[:event][:fire].to_sym) && @ticket.update_attributes(params[@ticket.type.downcase])
  end
  
end
