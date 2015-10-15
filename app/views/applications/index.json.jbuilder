json.array!(@applications) do |application|
  json.extract! application, :id, :company_id, :board_id, :job_id, :stage, :category, :settings, :created_at, :updated_at, :applied_date
  json.url application_url(application, format: :json)
  json.interactions application.interactions
end
