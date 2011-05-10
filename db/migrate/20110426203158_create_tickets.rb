class CreateTickets < ActiveRecord::Migration
  def self.up
    create_table :tickets do |t|
      t.string        :type
      t.string        :title                    # All
      t.string        :description              # All
      t.string        :state                    # All
      t.references    :select_fixed_in_versions # Bug
      t.timestamps
      t.integer       :lock_version, :default => 0
    end
  end

  def self.down
    drop_table :tickets
  end
end
