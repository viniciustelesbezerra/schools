class CreateAlunos < ActiveRecord::Migration
  def change
    create_table :alunos do |t|
      t.string :name
      t.integer :age
      t.references :turma

      t.timestamps
    end
    add_index :alunos, :turma_id
  end
end
