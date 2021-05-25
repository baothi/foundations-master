module ActivityType
  class ModelUpdate < Activity

    require_details :id, :name

    def description
      "updated model #{details['id']}"
    end

    def feed_label
      'Edit Model'
    end

    def feed_summary
      "Edited the model: #{details["name"]}"
    end
  end
end
