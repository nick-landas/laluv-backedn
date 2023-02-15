class ParlorShowSerializer < ActiveModel::Serializer
    attributes :id, :name, :current_member
  
    has_many :enrollments
    has_many :members, serializer: MemberSerializer
    has_many :messages
  
    def current_member
      object.enrollments.current_member(current_user)
    end
  
  end