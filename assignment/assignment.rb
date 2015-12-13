require_relative '../config/environment'

# Use Active Record Model methods to implement the following methods.
class Assignment

  #
  # Insert rows in DB
  #
  def create_user(params)
    @user = User.new(params)
    @user.save
  end

  def create_todolist(params)
    @todolist = TodoList.new
    @todolist.list_name = params[:name]
    @todolist.list_due_date = params[:due_date]
    @todolist.save
  end

  #
  # Retrieve paginated results from DB
  #
  def find_allusers(offset, limit)
    @user = User.all.offset(offset).limit(limit)
  end

  def find_alllists(offset, limit)
    @todolist = TodoList.all.offset(offset).limit(limit).order(list_due_date: :desc)
  end

  #
  # Query DB with exact match
  #
  def find_user_byname(username)
    @user = User.where(username: username)
  end

  def find_todolist_byname(name)
    @todolist = TodoList.where(list_name: name)
  end

  #
  # Get rows from DB by PK
  #
  def get_user_byid(id)
    @user = User.find_by_id(id)
  end

  def get_todolist_byid(id)
    @todolist = TodoList.find_by_id(id)
  end

  #
  # Update rows in DB
  #
  def update_password(id, password_digest)
    @user = User.update(id, password_digest: password_digest)
  end

  def update_listname(id, name)
    @todolist = TodoList.update(id, list_name: name)
  end

  #
  # Delete rows from DB
  #
  def delete_user(id)
    @user = User.destroy(id)
  end

  def delete_todolist(id)
    @todolist = TodoList.destroy(id)
  end
end
