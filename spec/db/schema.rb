ActiveRecord::Schema.define do
  create_table "posts", :force => true do |t|
    t.string   "title"
    t.string   "token"

    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string "username"
    t.string "secret_hash"

    t.datetime "created_at"
    t.datetime "updated_at"
  end
end
