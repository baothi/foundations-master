module ActivityType
  class CommunityCreation < Activity

    require_details :id, :name

    def description
      "created community #{details['id']}"
    end

    def feed_label
      'New Community'
    end

    def feed_summary
      "Added the community: #{details["name"]}"
    end
  end
end
