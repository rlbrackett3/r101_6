class CreateJoinTableBoardTopic < ActiveRecord::Migration
  def change
    create_join_table :boards, :topics do |t|
       t.index [:board_id, :topic_id]
       t.index [:topic_id, :board_id]
    end
  end
end
