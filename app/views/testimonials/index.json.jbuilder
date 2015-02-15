json.array!(@testimonials) do |testimonial|
  json.extract! testimonial, :id, :content, :user_id
  json.url testimonial_url(testimonial, format: :json)
end
