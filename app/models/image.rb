# frozen_string_literal: true

class Image < ActiveRecord::Base
  attr_accessor :image_file_name, :image_content_type, :image_file_size, :image_updated_at

  belongs_to :product

  has_attached_file :image, styles: { medium: '300x300>', thumb: '100x100>' }
  validates_attachment_content_type :image, content_type: %r{\Aimage/.*\Z}
end
