class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :password_digest
      t.string :image_url
      t.string :bio

      t.timestamps
    end

    add_index :users, :username, unique: true
  end
end
