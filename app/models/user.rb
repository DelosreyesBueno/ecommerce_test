# frozen_string_literal: true

class User < ActiveRecord::Base
  has_one :client
  has_one :admin

  has_many :categories, foreign_key: 'user_id'
  has_many :products, foreign_key: 'user_id'
  has_many :logs

  validates :name, :email, presence: true, uniqueness: true
  validates :password, presence: true

  def user_admin?
    type == 'Admin'
  end

  def user_client?
    type == 'Client'
  end
end
