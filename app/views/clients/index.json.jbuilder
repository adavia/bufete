json.array!(@clients) do |client|
  json.name         client.name
  json.path         company_client_path(client.company, client)
end
