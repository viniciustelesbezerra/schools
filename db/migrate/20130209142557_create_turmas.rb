class CreateTurmas < ActiveRecord::Migration
  def change
    create_table :turmas do |t|
      t.string :name

      t.timestamps
    end
  end
end
