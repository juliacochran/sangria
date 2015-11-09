json.array!(@applications) do |application|
  json.extract! application, :id, :company_id, :board_id, :job, :stage, :category, :settings, :created_at, :updated_at, :applied_date
  json.company Company.find(application.company_id)
  json.url application_url(application, format: :json)
  json.interactions application.interactions
end
