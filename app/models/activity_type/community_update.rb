module ActivityType
  class CommunityUpdate < Activity

    require_details :id, :name

    def description
      "updated community #{details['id']}"
    end

    def feed_label
      'Edit Community'
    end

    def feed_summary
      "Edited the community: #{details["name"]}"
    end
  end
end
