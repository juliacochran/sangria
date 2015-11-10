json.array!(@notes) do |note|
  json.extract! note, :id, :board_id, :details, :remind_date
  json.url note_url(note, format: :json)
end
