class CreateDisciplinasTurmas < ActiveRecord::Migration
  def change
    create_table :disciplina_turmas do |t|
      t.references :disciplina
      t.references :turma

      t.timestamps
    end
    add_index :disciplina_turmas, :disciplina_id
    add_index :disciplina_turmas, :turma_id
  end
end
