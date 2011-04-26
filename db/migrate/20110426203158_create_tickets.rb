class CreateTickets < ActiveRecord::Migration
  def self.up
    create_table :tickets do |t|
      t.string        :type
      t.string        :title
      t.string        :description
      t.timestamps
    end
  end

  def self.down
    drop_table :tickets
  end
end
