json.extract! job, :id, :title, :description, :budget, :project_type, :experience_level, :deadline, :user_id, :created_at, :updated_at
json.url job_url(job, format: :json)
