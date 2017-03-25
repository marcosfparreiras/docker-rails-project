require 'rails_helper'

RSpec.describe "documents/edit", type: :view do
  before(:each) do
    @document = assign(:document, Document.create!(
      :name => "MyString",
      :status => 1,
      :path => "MyString",
      :document_type => nil
    ))
  end

  it "renders the edit document form" do
    render

    assert_select "form[action=?][method=?]", document_path(@document), "post" do

      assert_select "input#document_name[name=?]", "document[name]"

      assert_select "input#document_status[name=?]", "document[status]"

      assert_select "input#document_path[name=?]", "document[path]"

      assert_select "input#document_document_type_id[name=?]", "document[document_type_id]"
    end
  end
end
