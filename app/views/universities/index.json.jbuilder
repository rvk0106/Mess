json.array!(@universities) do |university|
  json.extract! university, :id, :university_name
  json.url university_url(university, format: :json)
end
