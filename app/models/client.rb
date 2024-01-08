# frozen_string_literal: true

class Client < User
  has_many :purchases, foreign_key: 'user_id'
  belongs_to :user, optional: true
end
