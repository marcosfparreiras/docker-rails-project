require 'rails_helper'

RSpec.describe DocumentType, type: :model do
  context 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_uniqueness_of(:name) }

    valid_slugs = [
      'passport', 'transcript_hs', 'transcript_univ',
      'translated_transcirpt_univ', 'gpa', 'sat', 'toefl'
    ]
    valid_slugs.to_a.each do |value|
      it "allows slug equals to #{value}" do
        doc = DocumentType.new(slug: value, description: 'anything', name: 'THE NAME')
        expect(doc).to be_valid
      end
    end

    it "does not allow slug rather then #{valid_slugs.inspect}" do
      doc = DocumentType.new(slug: 'some other doc type', description: 'anything', name: 'THE NAME')
      expect(doc).not_to be_valid
    end
  end
end
