require 'rails_helper'

RSpec.describe "document_types/index", type: :view do
  before(:each) do
    assign(:document_types, [
      DocumentType.create!(
        :name => "Name",
        :description => "MyText"
      ),
      DocumentType.create!(
        :name => "Name",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of document_types" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
