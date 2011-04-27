module TicketsHelper
  def edit_ticket_path_by_type(ticket)
    self.send("edit_"+ticket.type.downcase+"_path", ticket)
  end
end
