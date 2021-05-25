module ActivityType
  class ClientUpdate < Activity

    require_details :id, :full_name

    def description
      "updated client #{details['id']}"
    end

    def feed_label
      'Edit Client'
    end

    def feed_summary
      "Edited the client: #{details["full_name"]}"
    end
  end
end
