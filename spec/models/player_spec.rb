require 'rails_helper'

RSpec.describe Player, type: :model do
  context 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should belong_to(:plan).class_name('Plan') }
    it { should have_one(:priority).class_name('Priority') }
  end

  before :all do
    @plan = Plan.create(name: 'My Plan', value: 199.99)
    @doc_type1 = DocumentType.create(name: 'Doc Type1', description: 'Blah')
    @doc_type2 = DocumentType.create(name: 'Doc Typ22', description: 'Bleh')
    @player = Player.create(name: 'Jhon Doe', email: 'jd@jd.com')
  end

  it 'has a plan' do
    @player.plan = @plan
    expect(@player.plan).to eq(@plan)
  end

  context 'documents' do
    before :all do
      @doc1 = Document.create(status: 0, document_type: @doc_type1)
      @doc2 = Document.create(status: 1, document_type: @doc_type2)
      @player.documents << @doc1
      @player.documents << @doc2
    end

    it 'has the two added documents' do
      expect(@player.documents).to include(@doc1).and(include(@doc2))
    end

    it 'has exactly two documents' do
      expect(@player.documents.size).to eq(2)
    end
  end
end
