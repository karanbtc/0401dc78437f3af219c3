class User
  include Mongoid::Document
  field :first_name, type: String
  field :last_name, type: String
  field :email, type: String
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 
  field :id, type: Integer
end
