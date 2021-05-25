module ActivityType
  class ModelCreation < Activity

    require_details :id, :name

    def description
      "created model #{details['id']}"
    end

    def feed_label
      'New Model'
    end

    def feed_summary
      "Added the model: #{details["name"]}"
    end
  end
end
