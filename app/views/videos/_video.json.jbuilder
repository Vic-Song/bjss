json.extract! video, :id, :title, :description, :video_url, :duration, :author, :chapter_id, :created_at, :updated_at
json.url video_url(video, format: :json)