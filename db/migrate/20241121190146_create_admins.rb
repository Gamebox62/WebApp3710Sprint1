class CreateAdmins < ActiveRecord::Migration[7.1]
  def change
    create_table :admins do |t|
      t.string :username
      t.string :password
      t.string :email
      t.datetime :sign_up_date

      t.timestamps
    end
  end
end
