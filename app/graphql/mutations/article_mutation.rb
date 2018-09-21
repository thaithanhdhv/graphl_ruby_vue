module Mutations
  ArticleMutation = GraphQL::ObjectType.define do
    name "AuthorMutation"

    field :createArticle, Types::ArticleType do
      argument :title, !types.String
      argument :content, !types.String
      resolve ->(_obj, args, _ctx) do
        Article.create(
          name: args[:name],
          content: args[:content]
        )
      end
    end

    # field :updateAuthor do
    #   # Other way to define a type
    #   type Types::AuthorType
    #   argument :id, !types.ID
    #   argument :name, !types.String
    #   resolve ->(obj, args, ctx) {
    #     author = Author.find_by id: (args[:id])
    #     author.update_attributes(name: args[:name])
    #     author
    #   }
    # end
    #
    # field :deleteAuthor, Types::AuthorType do
    #   argument :id, !types.ID
    #   resolve ->(obj, args, ctx) {
    #     author = Author.find_by id: (args[:id])
    #     author.destroy
    #   }
    # end

  end
end
