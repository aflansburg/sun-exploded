class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :first_name, require: true
      t.string :last_name, require: true
      t.string :email, index: { unique: true, name: 'unique_emails' }
      t.string :mobile_phone, require: true

      t.timestamps
    end
  end
end
