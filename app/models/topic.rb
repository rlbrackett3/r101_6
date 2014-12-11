class Topic < ActiveRecord::Base
	has_many :comments
	belongs_to :users
	has_and_belongs_to_many :boards
	accepts_nested_attributes_for :boards 
end
