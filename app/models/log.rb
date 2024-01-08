# frozen_string_literal: true

class Log < ActiveRecord::Base
  belongs_to :user, optional: true
  validates :model_type, :model_id, presence: true

  def self.create_log(model, model_type, log_type, log_changes)
    transaction do
      create(
        user_id: model.user,
        model_type: model_type,
        model_id: model.id,
        log_type: log_type,
        log_changes: log_changes
      )
    end
  end
end
