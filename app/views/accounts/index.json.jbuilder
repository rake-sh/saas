json.array!(@accounts) do |account|
  json.extract! account, :id, :subdomain
  json.url account_url(account, format: :json)
end
