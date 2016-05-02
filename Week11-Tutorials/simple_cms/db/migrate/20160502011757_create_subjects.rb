class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :name
      t.string :position
      t.boolean :visible, default: false
      t.timestamps null: false
    end
  end
end
