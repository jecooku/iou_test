module UsersHelper

  def current_user_bis
    User.find(self.id)
  end
end
