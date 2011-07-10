class CreateAlternatives < ActiveRecord::Migration
  def change
    create_table :alternatives do |t|
      t.string :description
      t.integer :poll_id

      t.timestamps
    end
  end
end
