json.extract! user, :id, :nome, :cpf, :idade, :profissao, :created_at, :updated_at
json.url user_url(user, format: :json)
