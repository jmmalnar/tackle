class CreateSelectFixedInVersion < ActiveRecord::Migration
  def self.up
    create_table :select_fixed_in_versions do |t|
      t.string        :value
    end
  end

  def self.down
    drop_table :select_fixed_in_versions
  end
end