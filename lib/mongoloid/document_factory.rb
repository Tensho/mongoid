module Mongoloid
  class DocumentFactory

    # Create a new Mongoloid::Document. This behavior was moved here to 
    # keep Document itself under control - the constructor didn't need all
    # the logic there.
    def self.create(attributes)
      document_class = attributes[:document_class]
      document = document_class.constantize.new(attributes)
      attributes.each_key do |key|
        attribute = attributes[key]
        association = document.associations[key]
        association.instance = create(attribute) if association
      end
      document
    end

  end
end