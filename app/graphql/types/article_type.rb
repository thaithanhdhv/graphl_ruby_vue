Types::ArticleType = GraphQL::ObjectType.define do
  name "Article"

  field :id, types.ID
  field :title, types.String
  field :content, types.String
end
