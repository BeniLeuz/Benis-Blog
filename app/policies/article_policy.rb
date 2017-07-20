class ArticlePolicy <  ApplicationPolicy

  def destroy?
    user.admin?
  end




  attr_reader :user, :article

  def initialize(user, article)
    @user = user
    @article = article
  end

  def update
    user.admin? or not article.published?
  end


end