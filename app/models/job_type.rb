class JobType < ApplicationRecord
  # referencias a muitos
  has_many :users
  # validar o campo de categoria
  validates :category, presence: true
end

