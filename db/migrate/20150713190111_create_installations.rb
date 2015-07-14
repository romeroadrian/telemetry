class CreateInstallations < ActiveRecord::Migration
  def change
    create_table :installations do |t|
      t.string :uuid
      t.datetime :last_reported_at
      t.string :ip
      t.string :lat
      t.string :lng
      t.string :admin_email
      t.string :application
      t.index :uuid

      t.timestamps null: false
    end
  end
end
