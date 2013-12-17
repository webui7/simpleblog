module ApplicationHelper
  def check_comments_user(comment)
    if comment.user
      comment.user
    else
      "Anonimus"
    end
    
  end
end
