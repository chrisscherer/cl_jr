class Post < ActiveRecord::Base
  require 'securerandom'
  belongs_to :category

  def self.generate_key
    key = SecureRandom.hex(4)
  end
end
