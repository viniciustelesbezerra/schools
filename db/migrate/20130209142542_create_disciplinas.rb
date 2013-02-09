class CreateDisciplinas < ActiveRecord::Migration
  def change
    create_table :disciplinas do |t|
      t.string :name
      t.references :professor

      t.timestamps
    end
    add_index :disciplinas, :professor_id
  end
end
