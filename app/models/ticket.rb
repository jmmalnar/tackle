class Ticket < ActiveRecord::Base
  
  has_many :comments
  
  state_machine :initial => :open do
    
    before_transition :on => :start_dev, :do => :say_hello
    
    event :start_dev do      
      transition [:open, :failed_test, :failed_retest_on_trunk, :paused, :reopened, :invalid] => :in_dev
    end
    
    event :make_invalid do
      transition [:open, :paused] => :invalid
    end
    
    event :pause_dev do
      transition :in_dev => :paused
    end
    
    event :finish_dev do
      transition :in_dev => :in_test
    end
    
    event :retest_on_trunk do
      transition :in_test => :retest_on_trunk
    end
    
    event :fail_test do
      transition :in_test => :failed_test
      transition :retest_on_trunk => :failed_retest_on_trunk
    end
    
    event :pass_test do
      transition [:in_test, :retest_on_trunk] => :closed
    end
    
    event :reopen do
      transition :closed => :reopened
    end
    
  end
        
  def say_hello
    puts "hello"
  end
end
