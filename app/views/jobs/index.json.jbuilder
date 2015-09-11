json.array!(@jobs) do |job|
  json.extract! job, :id, :user_id, :title, :type
  json.url job_url(job, format: :json)
end
