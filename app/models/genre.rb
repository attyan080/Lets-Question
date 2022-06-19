class Genre < ApplicationRecord
  has_many :questions,dependent: :destroy
end
