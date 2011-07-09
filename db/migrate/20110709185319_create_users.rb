class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :email
      t.string  :uid
      t.string  :name
      t.string  :last_name
      t.string  :rol
      t.string  :rut
      t.string  :carreer
      t.boolean :registered, :default => false

      t.timestamps
    end
  end
end
