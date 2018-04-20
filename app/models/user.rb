class User < ActiveRecord::Base
  has_secure_password
  has_many:organizations
  has_many:joins
  has_many:organizations_joined, through: :joins, source: :organization

  email_regex = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: { with: email_regex }
  validates :first_name, :last_name, :password, presence: true
  validates :first_name,length:{minimum:2, message:"must be at least 2 characters"}
  validates :last_name,length:{minimum:2, message:"must be at least 2 characters"}
  validates :password,length:{minimum:6, message:"must be at least 6 characters"}

end
