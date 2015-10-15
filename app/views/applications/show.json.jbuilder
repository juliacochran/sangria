json.extract! @application, :id, :job_id, :settings, :created_at, :updated_at, :applied_date
json.company Company.find(@application.company_id)
json.category Application.categories[@application.category]
json.stage Board.stages[@application.category]
json.interactions @application.interactions do |interaction|
  json.extract! interaction, :id, :title, :category, :date, :details, :created_at, :updated_at
  unless interaction.contact_id.nil?
    json.contact Contact.find(interaction.contact_id)
  end
end
