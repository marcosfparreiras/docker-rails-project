require 'rails_helper'

RSpec.describe "document_types/show", type: :view do
  before(:each) do
    @document_type = assign(:document_type, DocumentType.create!(
      :name => "Name",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
  end
end
