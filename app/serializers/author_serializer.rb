# class AuthorSerializer
#   include FastJsonapi::ObjectSerializer
#   attributes :name
#   has_many :articles, if: Proc.new {|record| record.articles.any?}
# end

class AuthorSerializer < ActiveModel::Serializer
  # attributes to be serialized
  attributes :id, :name, :last_name
  # model association
  has_many :articles, if: Proc.new {|record| record.articles.any?}
end
