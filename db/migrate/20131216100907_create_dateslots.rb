class CreateDateslots < ActiveRecord::Migration
  def change
    create_table :dateslots do |t|
      t.string :title
      t.date :date
      t.time :start_time
      t.time :end_time
      t.text :schedule
      t.timestamps
    end
  end
end
