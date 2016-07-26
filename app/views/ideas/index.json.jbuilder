json.array!(@ideas) do |idea|
  json.extract! idea, :id, :title, :description, :video_url, :project_owner_id, :likes, :category_id
  json.url idea_url(idea, format: :json)
end
