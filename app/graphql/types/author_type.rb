Types::AuthorType = GraphQL::ObjectType.define do
  name "Author"

  field :id, !types.ID
  field :name, !types.String
  #get all Articles of authors
  field :articles, types[Types::ArticleType]
end
