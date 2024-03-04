require 'sinatra'
require 'json'
require './transaction_checker'

post '/check_transaction' do
  payload = JSON.parse(request.body.read, symbolize_names: true)
  checker = TransactionChecker.new(payload)

  result = checker.call
  status 200
  content_type :json

  { transaction_id: payload[:transaction_id], recommendation: result ? 'approve' : 'deny' }.to_json
end