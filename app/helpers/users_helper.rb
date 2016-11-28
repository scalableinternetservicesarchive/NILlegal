module UsersHelper
  def cache_key_for_user(user)
    "dare-#{user.id}-#{user.updated_at}"
  end
end
