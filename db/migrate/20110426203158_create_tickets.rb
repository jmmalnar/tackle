class CreateTickets < ActiveRecord::Migration
  def self.up
    create_table :tickets do |t|
      t.string        :type
      t.string        :title                    # All
      t.string        :description              # All
      t.string        :state                    # All
      t.references    :feature                  # Tasks & Bugs
      t.references    :task                     # Bugs
      t.references    :select_fixed_in_version  # Bugs  --- this shouldn't be an ID - it should be as string. The values in the dropdown should come from git
      t.timestamps
      t.integer       :lock_version, :default => 0
    end
  end

  def self.down
    drop_table :tickets
  end
end
