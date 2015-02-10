json.array!(@testimonials) do |testimonial|
  json.extract! testimonial, :id, :testimonial
  json.url testimonial_url(testimonial, format: :json)
end
