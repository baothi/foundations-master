module ActivityType
  class UserCreation < Activity

    require_details :id, :email

    def description
      "created user #{details['id']}"
    end

    def feed_label
      'Add User'
    end

    def feed_summary
      "Added the user: #{details["full_name"] ? details["full_name"] : details["email"]}"
    end
  end
end
