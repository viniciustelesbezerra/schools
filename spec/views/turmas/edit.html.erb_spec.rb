require 'spec_helper'

describe "turmas/edit" do
  before(:each) do
    @turma = assign(:turma, stub_model(Turma,
      :name => "MyString"
    ))
  end

  it "renders the edit turma form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => turmas_path(@turma), :method => "post" do
      assert_select "input#turma_name", :name => "turma[name]"
    end
  end
end
