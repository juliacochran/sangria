json.array!(@applications) do |application|
  json.extract! application, :id, :company_id, :board_id, :job_id, :stage, :type, :settings
  json.url application_url(application, format: :json)
end
