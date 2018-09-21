module Mutations
  AuthorMutation = GraphQL::ObjectType.define do
    name "AuthorMutation"

    field :createAuthor, Types::AuthorType do
      argument :name, !types.String
      resolve ->(_obj, args, _ctx) do
        Author.create(
          name: args[:name]
        )
      end
    end

    field :updateAuthor do
      # Other way to define a type
      type Types::AuthorType
      argument :id, !types.ID
      argument :name, !types.String
      resolve ->(obj, args, ctx) {
        author = Author.find_by id: (args[:id])
        author.update_attributes(name: args[:name])
        author
      }
    end

    field :deleteAuthor, Types::AuthorType do
      argument :id, !types.ID
      resolve ->(obj, args, ctx) {
        author = Author.find_by id: (args[:id])
        author.destroy
      }
    end

  end
end
