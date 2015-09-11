json.array!(@notes) do |note|
  json.extract! note, :id, :board_id, :title, :details, :remind_date
  json.url note_url(note, format: :json)
end
