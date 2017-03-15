require 'rails_helper'

RSpec.describe "plans/edit", type: :view do
  before(:each) do
    @plan = assign(:plan, Plan.create!(
      :name => "MyString",
      :value => "9.99",
      :description => "MyText"
    ))
  end

  it "renders the edit plan form" do
    render

    assert_select "form[action=?][method=?]", plan_path(@plan), "post" do

      assert_select "input#plan_name[name=?]", "plan[name]"

      assert_select "input#plan_value[name=?]", "plan[value]"

      assert_select "textarea#plan_description[name=?]", "plan[description]"
    end
  end
end
