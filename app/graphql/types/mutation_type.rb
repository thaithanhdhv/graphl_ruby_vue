# Types::MutationType = GraphQL::ObjectType.define do
#   name 'Mutation'
#   field :testField, types.String do
#     description 'An example field added by the generator'
#     resolve ->(_obj, _args, _ctx) {
#       'Hello World!'
#     }
#   end
#
#   field :create_author, Types::AuthorType do
#     argument :name, !types.String
#
#     resolve ->(_obj, args, _ctx) do
#       Author.create(
#         name: args[:name]
#       )
#     end
#   end
# end
Types::MutationType = GraphQL::ObjectType.new.tap do |root_type|
  root_type.name = "Mutation"
  root_type.description = "The mutation root of this schema"
  root_type.interfaces = []
  root_type.fields = Util::FieldCombiner.combine([
    Mutations::AuthorMutation
  ])
end
