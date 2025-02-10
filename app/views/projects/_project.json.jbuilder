json.extract! project, :id, :owner_id, :name, :status, :created_at, :updated_at
json.url project_url(project, format: :json)
