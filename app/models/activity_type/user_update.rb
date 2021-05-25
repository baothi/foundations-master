module ActivityType
  class UserUpdate < Activity

    require_details :id, :email

    def description
      "updated user #{details['id']}"
    end

    def feed_label
      'Edit User'
    end

    def feed_summary
      "Edited the user: #{details["full_name"] ? details["full_name"] : details["email"]}"
    end
  end
end
