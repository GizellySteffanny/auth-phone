class User < ApplicationRecord
  has_one :access

  accepts_nested_attributes_for :access
end
