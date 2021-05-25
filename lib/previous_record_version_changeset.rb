class PreviousRecordVersionChangeset

  def initialize(record)
    @record = record
  end

  def changeset
    return new_entry_changeset unless previous_version.present?

    unignored_attribute_keys.inject({}) do |changes, attribute_name|
      changes[attribute_name] = changeset_entry_for(attribute_name) if changed?(attribute_name)
      changes
    end
  end

  private

  attr_reader :record

  def previous_version
    @previous_version ||= record.previous_version
  end

  def changed?(attribute_name)
    new_attributes[attribute_name] != old_attributes[attribute_name]
  end

  def new_entry_changeset
    unignored_attribute_keys.inject({}) do |changes, attribute_name|
      changes[attribute_name] = { to: new_attributes[attribute_name] }
      changes
    end
  end

  def changeset_entry_for(attribute_name)
    {
        from: old_attributes[attribute_name],
        to:   new_attributes[attribute_name]
    }
  end

  def unignored_attribute_keys
    new_attributes.keys - ignored_attributes
  end

  def ignored_attributes
    ["created_at", "updated_at", "one_time_password_counter", "encrypted_password"]
  end

  def old_attributes
    @old_attributes ||= previous_version.attributes
  end

  def new_attributes
    record.attributes
  end

end
