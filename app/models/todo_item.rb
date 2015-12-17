class TodoItem < ActiveRecord::Base
  belongs_to :todo_list

  def self.calculate_completed_items
    self.where(completed: true).count
  end

end
