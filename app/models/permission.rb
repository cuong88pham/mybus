class Permission < ActiveRecord::Base

  has_many :roles_permissions, dependent: :destroy
  has_many :roles, :through => :roles_permissions

  validates :action, presence: true,  uniqueness: {scope: [:subject_class]}
  validates :subject_class, presence: true

  scope :newest,  -> { order('created_at desc') }
  scope :by_subject_class, -> subject_class { where(subject_class: subject_class) }

  def name
    if can
      "Can "
    else
      "Can Not"
    end +
    self.action +
    " " +
    self.subject_class
  end

  def self.assign_model(subject_class_name)
    actions = ['manage', 'read', 'create', 'update', 'destroy']
    actions.each do |act|
      Permission.create(
                          action: act,
                          subject_class: subject_class_name
                        )
    end
  end

  # Unassign model into Permission
  def self.unassign_model(subject_class_name)
    Permission.where(subject_class: subject_class_name).destroy_all
  end

end
