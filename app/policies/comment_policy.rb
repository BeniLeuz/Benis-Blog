class CommentPolicy <  ApplicationPolicy

  def destroy?
    user.admin?
  end



  attr_reader :user, :comment

  def initialize(user, comment)
    @user = user
    @comment = comment
  end

  def destroy
    user.admin? or not comment.published?
  end
end