class CreateBallots < ActiveRecord::Migration
  def change
    create_table :ballots do |t|
      t.integer :alternative_id
      t.integer :user_id
      t.integer :poll_id

      t.timestamps
    end
  end
end
