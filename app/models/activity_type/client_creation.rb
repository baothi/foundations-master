module ActivityType
  class ClientCreation < Activity

    require_details :id, :full_name

    def description
      "created client #{details['id']}"
    end

    def feed_label
      'New Client'
    end

    def feed_summary
      "Added the client: #{details["full_name"]}"
    end
  end
end
