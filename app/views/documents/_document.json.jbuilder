json.extract! document, :id, :name, :status, :path, :document_type_id, :created_at, :updated_at
json.url document_url(document, format: :json)
