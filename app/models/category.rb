# frozen_string_literal: true

class Category < ActiveRecord::Base
  after_create :category_log
  before_update :category_log

  has_and_belongs_to_many :products
  belongs_to :user, foreign_key: 'user_id' # Se utiliza de esta manera para no hacer eliminacion en cascada al momento de borrar relacionado a la categoria
  validates :name, presence: true, uniqueness: true

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
