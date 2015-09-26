class Message < ActiveRecord::Base

  belongs_to :task
  validates :text, :task, presence: true

  after_create  {self.task.increment!(:msg_count)}
  after_destroy {self.task.decrement!(:msg_count)}

end
