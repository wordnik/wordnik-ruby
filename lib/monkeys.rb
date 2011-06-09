class Object

  unless method_defined? :blank?
    # Snagged from Rails: http://api.rubyonrails.org/classes/Object.html#M000265
    def blank?
      respond_to?(:empty?) ? empty? : !self
    end
  end
  
  unless method_defined? :present?
    def present?
      !blank?
    end
  end

end

class String
  
  unless method_defined? :underscore
    # File activesupport/lib/active_support/inflector/methods.rb, line 48
    def underscore
      word = self.dup
      word.gsub!(/::/, '/')
      word.gsub!(/([A-Z]+)([A-Z][a-z])/,'\1_\2')
      word.gsub!(/([a-z\d])([A-Z])/,'\1_\2')
      word.tr!("-", "_")
      word.downcase!
      word
    end
  end
  
  unless method_defined? :camelize
    # File activesupport/lib/active_support/inflector/methods.rb, line 28
    def camelize(first_letter = :upper)
      parts = self.split(/[^a-z0-9]/i).map{|w| w.capitalize}
      parts[0].downcase! unless first_letter == :upper
      parts.join
    end
  end
  
  unless method_defined? :constantize
    # File activesupport/lib/active_support/inflector/methods.rb, line 107
    def constantize
      camel_cased_word = self.dup
      names = camel_cased_word.split('::')
      names.shift if names.empty? || names.first.empty?

      constant = Object
      names.each do |name|
        constant = constant.const_defined?(name) ? constant.const_get(name) : constant.const_missing(name)
      end
      constant
    end
  end
  
end

class Hash

  unless method_defined? :symbolize_keys!
    # File activesupport/lib/active_support/core_ext/hash/keys.rb, line 23
    def symbolize_keys!
      keys.each do |key|
        self[(key.to_sym rescue key) || key] = delete(key)
      end
      self
    end
  end

  unless method_defined? :symbolize_keys
    def symbolize_keys
      dup.symbolize_keys!
    end
  end
  
  unless method_defined? :stringify_keys!
    # File activesupport/lib/active_support/core_ext/hash/keys.rb, line 8
    def stringify_keys!
      keys.each do |key|
        self[key.to_s] = delete(key)
      end
      self
    end
  end
  
  unless method_defined? :stringify_keys
    def stringify_keys
      dup.stringify_keys!
    end
  end

end