class Post < ApplicationRecord
  #validations: ensures that empty blogs cant be saved. title needs a minimum of 5 char, body= any #...amount
  validates :title, presence: true, length: { minimum: 5 }
  validates :body, presence: true
end
