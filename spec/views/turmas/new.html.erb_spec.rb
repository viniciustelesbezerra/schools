require 'spec_helper'

describe "turmas/new" do
  before(:each) do
    assign(:turma, stub_model(Turma,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new turma form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => turmas_path, :method => "post" do
      assert_select "input#turma_name", :name => "turma[name]"
    end
  end
end
