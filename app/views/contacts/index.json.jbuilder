json.array!(@contacts) do |contact|
  json.extract! contact, :id, :company_id, :name, :email, :phone_number, :role
  json.url contact_url(contact, format: :json)
end
