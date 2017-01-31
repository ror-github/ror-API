class CreateTasks < ActiveRecord::Migration[5.0]
  def self.up
    create_table :tasks do |t|
      t.integer :survey_id
      t.string :taskname
      t.text :description
	  t.float :price
	  t.string :status
      t.timestamps :created_at
    end
  end

  def self.down
    drop_table :tasks
  end
end
