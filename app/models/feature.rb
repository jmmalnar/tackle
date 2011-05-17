class Feature < Ticket
  has_many :tasks
  has_many :bugs
end