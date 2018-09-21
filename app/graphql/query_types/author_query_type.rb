module QueryTypes
  AuthorQueryType =  GraphQL::ObjectType.define do
    name 'Author'

    # if return an array we shoud define with types[]
    field :allAuthors, types[Types::AuthorType] do
      description 'An example field added by the generator'
      resolve ->(_obj, _args, _ctx) { Author.all }
    end

    #if return an object, define with name of type.
    field :author, Types::AuthorType do
      argument :id, !types.ID
      description 'Root object to get viewer related collections'
      resolve ->(_obj, args, _ctx) {
        Author.find_by id: (args['id'])
      }
    end

  end
end
