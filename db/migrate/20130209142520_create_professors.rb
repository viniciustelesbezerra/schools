class CreateProfessors < ActiveRecord::Migration
  def change
    create_table :professors do |t|
      t.string :name
      t.integer :age

      t.timestamps
    end
  end
end
