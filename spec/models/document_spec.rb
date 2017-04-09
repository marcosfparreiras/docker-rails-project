require 'rails_helper'

RSpec.describe Document, type: :model do
  before :all do
    @doc_type = DocumentType.new(name: 'Doc Type', description: 'Desc')
    @player = Player.new(name: 'Jhon Doe', email: 'jhon@doe.com')
  end

  context 'validations' do
    (0..2).to_a.each do |value|
      it "allows status equals to #{value}" do
        doc = Document.new(status: value)
        doc.document_type = @doc_type
        doc.player = @player
        expect(doc).to be_valid
      end
    end

    it "does not allow status rather then [0, 1, 2]" do
      doc = Document.new(status: 4)
      doc.document_type = @doc_type
      expect(doc).not_to be_valid
    end
  end

  context 'status' do
    it 'retrns missing? = true when status equals to 0' do
      doc = Document.new(status: 0)
      expect(doc.missing?).to eq(true)
    end

    it 'returns pendent? = true when status equals to 1' do
      doc = Document.new(status: 1)
      expect(doc.pending?).to eq(true)
    end

    it 'returns ok? = true when status equals to 2' do
      doc = Document.new(status: 2)
      expect(doc.ok?).to eq(true)
    end
  end

  context 'relations' do
    before :all do
      @player = Player.create(name: 'Jhon Doe', email: 'jd@jd.com')
      @doc_type = DocumentType.create(name: 'Translated History', description: 'blah')
      @document = Document.create(status: 0, path: '/bla/ble')
      @document.document_type = @doc_type
      @document.player = @player
    end

    it 'relates document to player' do
      expect(@document.player).to eq(@player)
    end

    it 'relates document to document_type' do
      expect(@document.document_type).to eq(@doc_type)
    end
  end

  context 'scopes' do
    before :all do
      @doc1 = Document.create(status: 0, document_type: @doc_type, player: @player)
      @doc2 = Document.create(status: 0, document_type: @doc_type, player: @player)
      @doc3 = Document.create(status: 1, document_type: @doc_type, player: @player)
      @doc4 = Document.create(status: 1, document_type: @doc_type, player: @player)
      @doc5 = Document.create(status: 2, document_type: @doc_type, player: @player)
      @doc6 = Document.create(status: 2, document_type: @doc_type, player: @player)
    end
    describe 'pending' do
      before :all do
        @pending = Document.pending
      end

      it 'returns only Document with status pending' do
        expect(@pending.count).to eq(2)
      end

      it 'returns only Document with doc3 and doc4' do
        expect(@pending).to include(@doc3)
      end
    end
  end
end
