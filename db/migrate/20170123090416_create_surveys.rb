class CreateSurveys < ActiveRecord::Migration[5.0]
  def self.up
    create_table :surveys do |t|
      t.string :title
      t.text :description
	  t.float :price
	  t.string :status
      t.timestamps :created_at
    end
  end

  def self.down
    drop_table :surveys
  end
end
