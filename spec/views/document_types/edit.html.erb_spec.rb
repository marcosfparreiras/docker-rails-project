require 'rails_helper'

RSpec.describe "document_types/edit", type: :view do
  before(:each) do
    @document_type = assign(:document_type, DocumentType.create!(
      :name => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit document_type form" do
    render

    assert_select "form[action=?][method=?]", document_type_path(@document_type), "post" do

      assert_select "input#document_type_name[name=?]", "document_type[name]"

      assert_select "textarea#document_type_description[name=?]", "document_type[description]"
    end
  end
end
