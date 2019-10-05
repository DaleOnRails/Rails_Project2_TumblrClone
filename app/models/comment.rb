class Comment < ApplicationRecord
  # used the command: rails g model Comment name:string body:text post:references
  #this creates the belongs_to by default.
  belongs_to :post
end
