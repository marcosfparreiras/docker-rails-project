require 'rails_helper'

RSpec.describe "document_types/new", type: :view do
  before(:each) do
    assign(:document_type, DocumentType.new(
      :name => "MyString",
      :description => "MyText"
    ))
  end

  it "renders new document_type form" do
    render

    assert_select "form[action=?][method=?]", document_types_path, "post" do

      assert_select "input#document_type_name[name=?]", "document_type[name]"

      assert_select "textarea#document_type_description[name=?]", "document_type[description]"
    end
  end
end
