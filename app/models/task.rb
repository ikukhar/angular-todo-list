class Task < ActiveRecord::Base

  belongs_to :project
  has_many   :messages

  after_initialize :default_settings
  after_save       :update_project_done

  validates :name, :project, presence: true
  validates_inclusion_of :done, in: [true, false]

  private

  def default_settings
    self.done ||= false
    self.position ||= (Task.where(project: self.project).maximum(:position).to_i + 1)
  end

  def update_project_done
    count_false = Task.where(project: self.project, done: false).count
    self.project.update(done: count_false == 0 ? true : false)
  end

end
