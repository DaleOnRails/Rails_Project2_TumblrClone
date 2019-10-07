class Post < ApplicationRecord
  #validations: ensures that empty blogs cant be saved. title needs a minimum of 5 char, body= any #...amount
  #Relationship between data = a post has many comments and the comment belongs to the post(see comment.rb for more)
  #comments are dependent on posts meaning that now when posts are deleted their comments will be deleted with them
  has_many :comments, dependent: :destroy
  validates :title, presence: true, length: { minimum: 5 }
  validates :body, presence: true
end
