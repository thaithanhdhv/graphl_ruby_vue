class SignUpForm
  include ActiveModel::Model

  def author
    @author ||= Author.new
  end

  def submit params
    @author.attributes = params.slide(:name, :last_name)
    if valid?
      @author.save
      true
    else
      false
    end
  end
end
