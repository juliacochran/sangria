json.extract! @application, :id, :company_id, :board_id, :job_id, :stage, :category, :settings, :created_at, :updated_at, :applied_date
json.interactions @application.interactions
