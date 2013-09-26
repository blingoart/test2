class UniqueFileValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors.add attribute, (options[:message] || "has already been uploaded") unless
      #value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/
      #:file_name => value.count == 0
    value == "test"
  end
end
