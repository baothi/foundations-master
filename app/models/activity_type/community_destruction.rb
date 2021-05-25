module ActivityType
  class CommunityDestruction < Activity

    require_details :id, :name

    def description
      "deleted community #{details['id']}"
    end

    def feed_label
      'Delete Community'
    end

    def feed_summary
      "Deleted the community: #{details["name"]}"
    end
  end
end
