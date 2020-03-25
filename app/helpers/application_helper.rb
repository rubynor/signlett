module ApplicationHelper
  def full_name(user)
    user.first_name.concat(" #{user.last_name}")
  end
end
