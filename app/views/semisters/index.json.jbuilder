json.array!(@semisters) do |semister|
  json.extract! semister, :id, :course_id, :semister_name, :year
  json.url semister_url(semister, format: :json)
end
