class Question < ApplicationRecord
  belongs_to :customer
  belongs_to :genre
  has_many :answers,dependent: :destroy
end
