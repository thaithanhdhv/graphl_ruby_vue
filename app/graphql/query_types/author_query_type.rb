module QueryTypes
  AuthorQueryType =  GraphQL::ObjectType.define do
    name 'Author'

    field :allAuthors, types[Types::AuthorType] do
      description 'An example field added by the generator'
      resolve ->(_obj, _args, _ctx) { Author.all }
    end

    field :author, Types::AuthorType do
      argument :id, !types.ID
      description 'Root object to get viewer related collections'
      resolve ->(_obj, args, _ctx) {
        Author.find_by id: (args['id'])
      }
    end

  end
end
