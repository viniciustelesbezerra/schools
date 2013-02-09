class CreateDisciplinasTurmas < ActiveRecord::Migration
  def change
    create_table :disciplinas_turmas, id: false do |t|
      t.references :disciplina
      t.references :turma

      t.timestamps
    end
    add_index :disciplinas_turmas, :disciplina_id
    add_index :disciplinas_turmas, :turma_id
  end
end
