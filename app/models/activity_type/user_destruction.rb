module ActivityType
  class UserDestruction < Activity

    require_details :id, :email

    def description
      "deleted user #{details['id']}"
    end

    def feed_label
      'Delete User'
    end

    def feed_summary
      "Deleted the user: #{details["full_name"] ? details["full_name"] : details["email"]}"
    end
  end
end
