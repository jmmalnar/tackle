class Task < Ticket
  belongs_to :feature
  has_many :bugs
end