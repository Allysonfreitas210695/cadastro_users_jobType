class User < ApplicationRecord
  belongs_to :job_type
  belongs_to :admin

  validates :nome, :cpf, :idade, presence: true
end
