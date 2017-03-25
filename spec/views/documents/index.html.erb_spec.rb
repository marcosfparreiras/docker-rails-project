require 'rails_helper'

RSpec.describe "documents/index", type: :view do
  before(:each) do
    assign(:documents, [
      Document.create!(
        :name => "Name",
        :status => 2,
        :path => "Path",
        :document_type => nil
      ),
      Document.create!(
        :name => "Name",
        :status => 2,
        :path => "Path",
        :document_type => nil
      )
    ])
  end

  it "renders a list of documents" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Path".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
