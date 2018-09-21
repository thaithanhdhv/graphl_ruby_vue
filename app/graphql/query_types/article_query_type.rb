module QueryTypes
  ArtucleQueryType =  GraphQL::ObjectType.define do
    name 'Article'

    field :allArticle, types[Types::ArticleType] do
      description 'An example field added by the generator'
      resolve ->(_obj, _args, _ctx) { Article.all }
    end

    field :author, Types::ArticleType do
      argument :id, !types.ID
      description 'Root object to get viewer related collections'
      resolve ->(_obj, args, _ctx) {
        Article.find_by id: (args['id'])
      }
    end

  end
end
