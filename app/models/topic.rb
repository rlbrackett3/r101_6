class Topic < ActiveRecord::Base
	has_many :comments
	belongs_to :user
	has_and_belongs_to_many :boards
end
