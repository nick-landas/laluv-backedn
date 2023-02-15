class FanSerializer < ActiveModel::Serializer
    attributes :id, :username, :image_url
  
    has_many :memberships
  end