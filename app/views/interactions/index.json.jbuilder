json.array!(@interactions) do |interaction|
  json.extract! interaction, :id, :application_id, :title, :category, :date, :contact_id, :details
  json.url interaction_url(interaction, format: :json)
end
