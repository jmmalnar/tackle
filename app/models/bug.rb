class Bug < Ticket
  
  belongs_to :task
  
  state_machine do
    after_transition :on => :start_dev, :do => :start_dev_hook
  end
  
  private
  def start_dev_hook
    puts "dev started"
  end
end