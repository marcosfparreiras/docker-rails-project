require 'rails_helper'

RSpec.describe "plans/new", type: :view do
  before(:each) do
    assign(:plan, Plan.new(
      :name => "MyString",
      :value => "9.99",
      :description => "MyText"
    ))
  end

  it "renders new plan form" do
    render

    assert_select "form[action=?][method=?]", plans_path, "post" do

      assert_select "input#plan_name[name=?]", "plan[name]"

      assert_select "input#plan_value[name=?]", "plan[value]"

      assert_select "textarea#plan_description[name=?]", "plan[description]"
    end
  end
end
