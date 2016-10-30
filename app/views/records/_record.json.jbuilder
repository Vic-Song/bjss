json.extract! record, :id, :userinfo, :coursename, :trace, :created_at, :updated_at
json.url record_url(record, format: :json)