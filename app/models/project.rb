class Project < ActiveRecord::Base

  belongs_to :user
  has_many :tasks, dependent: :destroy
  
  after_initialize :default_settings

  validates :name, :user, presence: true
  validates_inclusion_of :done, in: [true, false]
  validates :position, numericality: { greater_than: 0 }

  private

  def default_settings
    self.done ||= false
    self.position ||= (Project.maximum(:position).to_i + 1)
  end

end
