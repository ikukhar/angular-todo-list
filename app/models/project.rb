class Project < ActiveRecord::Base

  has_many :tasks, dependent: :destroy
  belongs_to :user

  after_initialize :default_settings

  validates :name, :user, presence: true
  validates_inclusion_of :done, in: [true, false]
  validates :position, numericality: { greater_than: 0 }
  validates :position, uniqueness: { scope: :user }

  def to_json
    super(include: :tasks)
  end

  private

  def default_settings
    self.done ||= false
  end

end
