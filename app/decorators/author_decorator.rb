class AuthorDecorator < SimpleDelegator
  def full_name
    name + " " + last_name
  end
end
