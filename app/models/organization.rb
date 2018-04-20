class Organization < ActiveRecord::Base
  belongs_to :user
  has_many:joins, dependent: :delete_all
  has_many:joiners,through: :joins, source: :user
  
  validates :name, :description, presence: true
  validates :name,length:{minimum:5, message:"must be at least 5 characters"}
  validates :description,length:{minimum:10, message:"must be at least 10 characters"}
end
