User.destroy_all
TodoList.destroy_all
TodoItem.destroy_all
Profile.destroy_all

Profile.create! [
  { first_name: "Carly", last_name: "Fiorina", birth_year: 1954, gender: "female" },
  { first_name: "Donald", last_name: "Trump", birth_year: 1946, gender: "male" },
  { first_name: "Ben", last_name: "Carson", birth_year: 1951, gender: "male" },
  { first_name: "Hillary", last_name: "Clinton", birth_year: 1947, gender: "female" },
]

Profile.find_by!(last_name: "Fiorina").create_user(username: "Fiorina", password_digest: "123456")
Profile.find_by!(last_name: "Trump").create_user(username: "Trump", password_digest: "123456")
Profile.find_by!(last_name: "Carson").create_user(username: "Carson", password_digest: "123456")
Profile.find_by!(last_name: "Clinton").create_user(username: "Clinton", password_digest: "123456")

User.all.each do |user|
  todo_list = TodoList.create!(list_name: "User TodoList", list_due_date: Time.now + 1.year.to_i)
  user.todo_lists << todo_list
end

TodoList.all.each do |todo_list|
  5.times do
    todo_item = TodoItem.create!(title: "Todo Item", description: "Part of TodoList", due_date: Time.now + 1.year.to_i)
    todo_list.todo_items << todo_item
  end
end