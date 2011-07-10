class CreatePolls < ActiveRecord::Migration
  def change
    create_table :polls do |t|
      t.string :question
      t.datetime :start_date
      t.datetime :finish_date

      t.timestamps
    end
  end
end
