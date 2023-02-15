class MessageSerializer < ActiveModel::Serializer
    attributes :id, :content, :date_created
    
    belongs_to :fan, serializer: FanSerializer
  end