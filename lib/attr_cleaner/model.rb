module AttrCleaner
  module Model
    extend ActiveSupport::Concern

    included do
      alias_method_chain :write_attribute, :cleaner
      class_attribute :attr_cleaners
    end

    def write_attribute_with_cleaner(attr_name, value)
      if Array(attr_cleaners).include?(attr_name.to_sym) && value.is_a?(String)
        value = value.strip
        value = nil if value.empty?
      end

      write_attribute_without_cleaner(attr_name, value)
    end

    module ClassMethods
      def attr_cleaner(*columns)
        self.attr_cleaners = columns
      end
    end
  end
end
