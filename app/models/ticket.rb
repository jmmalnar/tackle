class Ticket < ActiveRecord::Base
  
  state_machine :initial => :open do
    
    after_transition :on => :start_dev, :do => :say_hello
    
    event :start_dev do      
      transition [:open, :failed_test, :stopped, :reopened] => :in_dev
    end
    
    event :stop_dev do
      transition :in_dev => :stopped
    end
    
    event :finish_dev do
      transition :in_dev => :in_test
    end
    
    event :fail_test do
      transition :in_test => :failed_test
    end
    
    event :pass_test do
      transition :in_test => :closed
    end
    
    event :reopen do
      transition :closed => :reopened
    end
    
  end
        
  def say_hello
    puts "hello"
  end
end
