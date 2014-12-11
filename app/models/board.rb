class Board < ActiveRecord::Base
	belongs_to :user
	has_and_belongs_to_many :topics
	accepts_nested_attributes_for :topics #added this, trying to figure out the stronng params issues. When trying to add topic to board, I get an error saying 'param is missing or the value is empty: board'
end
