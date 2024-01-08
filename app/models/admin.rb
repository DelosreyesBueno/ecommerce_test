# frozen_string_literal: true

class Admin < User
  belongs_to :user, optional: true

  scope :get_admin_except_one_email, lambda { |admin|
    where.not(email: admin.email).map(&:email)
  }

  scope :get_all_admin_emails, lambda {
    all.map(&:email)
  }
end
