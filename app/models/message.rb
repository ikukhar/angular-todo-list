class Message < ActiveRecord::Base

  belongs_to :task
  has_attached_file :file

  validates :text, :task, presence: true

  after_create  {self.task.increment!(:msg_count)}
  after_destroy {self.task.decrement!(:msg_count)}

end
