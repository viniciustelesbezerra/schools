require 'spec_helper'

describe "alunos/new" do
  before(:each) do
    assign(:aluno, stub_model(Aluno,
      :name => "MyString",
      :age => 1,
      :turma => nil
    ).as_new_record)
  end

  it "renders new aluno form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => alunos_path, :method => "post" do
      assert_select "input#aluno_name", :name => "aluno[name]"
      assert_select "input#aluno_age", :name => "aluno[age]"
      assert_select "input#aluno_turma", :name => "aluno[turma]"
    end
  end
end
