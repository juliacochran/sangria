json.array!(@boards) do |board|
  json.extract! board, :id, :user_id, :title
  json.url board_url(board, format: :json)
end
