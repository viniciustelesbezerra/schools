require 'spec_helper'

describe "professors/new" do
  before(:each) do
    assign(:professor, stub_model(Professor,
      :name => "MyString",
      :age => 1
    ).as_new_record)
  end

  it "renders new professor form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => professors_path, :method => "post" do
      assert_select "input#professor_name", :name => "professor[name]"
      assert_select "input#professor_age", :name => "professor[age]"
    end
  end
end
