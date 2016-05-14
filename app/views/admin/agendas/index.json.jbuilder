json.array!(@agendas) do |agenda|
  json.extract! agenda, :id
  json.url agenda_url(agenda, format: :json)
end
