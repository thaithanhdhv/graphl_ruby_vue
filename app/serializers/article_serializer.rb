class ArticleSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :content
  belongs_to :author, if: Proc.new {|record| record.author }
end
