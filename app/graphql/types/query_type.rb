# Types::QueryType = GraphQL::ObjectType.define do
#   name "Query"
#
#   field :testField, types.String do
#     description "An example field added by the generator"
#     resolve ->(obj, args, ctx) {
#       "Hello World!"
#     }
#   end
#
#   field :allAuthors, types[Types::AuthorType] do
#     description "An example field added by the generator"
#     resolve ->(obj, args, ctx) {  Author.all  }
#   end
#
#   field :author, Types::AuthorType do
#     argument :id, !types.ID
#     description 'Root object to get viewer related collections'
#     resolve -> (obj, args, ctx) {
#       Author.find_by id: (args["id"])
#     }
#   end
#
# end
Types::QueryType = GraphQL::ObjectType.new.tap do |root_type|
  root_type.name = "Query"
  root_type.description = "The query root of this schema"
  root_type.interfaces = []
  root_type.fields = Util::FieldCombiner.combine([
    QueryTypes::AuthorQueryType,
    QueryTypes::ArticleQueryType
  ])
end
