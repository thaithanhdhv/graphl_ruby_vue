module QueryTypes
  ArticleQueryType =  GraphQL::ObjectType.define do
    name 'Article'

    field :allArticle, types[Types::ArticleType] do
      description 'An example field added by the generator'
      resolve ->(_obj, _args, _ctx) { Article.all }
    end

    field :authorArticle,types[Types::ArticleType] do
      argument :id, !types.ID
      argument :author_id, !types.ID
      description 'Root object to get viewer related collections'
      resolve ->(_obj, args, _ctx) {
        author = Author.find_by id: (args['author_id'])
        author.articles
      }
    end

  end
end
