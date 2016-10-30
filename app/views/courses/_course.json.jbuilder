json.extract! course, :id, :title, :teacher, :teacher_intro, :description, :thumbnail_url, :trailer_url, :created_at, :updated_at
json.url course_url(course, format: :json)