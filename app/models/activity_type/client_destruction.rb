module ActivityType
  class ClientDestruction < Activity

    require_details :id, :full_name

    def description
      "deleted client #{details['id']}"
    end

    def feed_label
      'Delete Client'
    end

    def feed_summary
      "Deleted the client: #{details["full_name"]}"
    end
  end
end
