class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string     "first_name", limit: 25, null: false
      t.string     "last_name",  limit: 50, null: false
      t.string     "email",      default: ""
      t.string     "password",   limit: 40, null: false
      #t.datetime   "created_at"
      #t.datetime   "updated_at"
      t.timestamps               null: false
    end
  end

  def down
  	drop_table :users
  end
end
