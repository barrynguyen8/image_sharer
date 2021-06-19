class HashtagsPics < ActiveRecord::Migration[6.1]
  def change
    create_table :hashtags_pics do |t|
      t.index :hashtag_id
      t.index :pic_id
    end
  end
end


