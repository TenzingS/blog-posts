class PostSerializer < ActiveModel::Serializer
  attributes :id, :author, :authorId, :likes, :popularity, :reads, :tags
end
