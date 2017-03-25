require 'rails_helper'

RSpec.describe "documents/new", type: :view do
  before(:each) do
    assign(:document, Document.new(
      :name => "MyString",
      :status => 1,
      :path => "MyString",
      :document_type => nil
    ))
  end

  it "renders new document form" do
    render

    assert_select "form[action=?][method=?]", documents_path, "post" do

      assert_select "input#document_name[name=?]", "document[name]"

      assert_select "input#document_status[name=?]", "document[status]"

      assert_select "input#document_path[name=?]", "document[path]"

      assert_select "input#document_document_type_id[name=?]", "document[document_type_id]"
    end
  end
end
