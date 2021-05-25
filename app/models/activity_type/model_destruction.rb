module ActivityType
  class ModelDestruction < Activity

    require_details :id, :name

    def description
      "deleted model #{details['id']}"
    end

    def feed_label
      'Delete Model'
    end

    def feed_summary
      "Deleted the model: #{details["name"]}"
    end
  end
end
