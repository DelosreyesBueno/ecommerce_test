# frozen_string_literal: true

class Product < ActiveRecord::Base
  after_create :category_log
  before_update :category_log

  validates :name, presence: true, uniqueness: true

  has_many :images, dependent: :destroy
  has_many :purchases

  has_and_belongs_to_many :categories
  belongs_to :user, foreign_key: 'user_id' # Se utiliza de esta manera para no hacer eliminacion en cascada al momento de borrar relacionado al producto

  accepts_nested_attributes_for :images, allow_destroy: true

  private

  def category_log
    return unless user.user_admin?

    changes = changed? ? self.changes.except('updated_at', 'created_at') : ''
    transaction do
      Log.create(
        user_id: user,
        model_type: self.class.to_s,
        model_id: id,
        log_type: changes.blank? ? 'Create' : 'Update',
        log_changes: changes
      )
    end
  end
end
