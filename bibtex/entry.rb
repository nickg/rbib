module BibTeX

  # A single entry in a bibliography
  class Entry
    attr_reader :type, :key
    
    def initialize(type, key)
      @type = type
      @key = key
      @fields = {}
    end

    def add_field(obj, value = nil)
      if obj.kind_of? Field then
        @fields[obj.key] = obj
      else
        @fields[obj] = Field.new(obj, value)
      end
    end

    def [](key)
      f = @fields[key]
      if f then
        f.value
      else
        raise "No field with key #{key}"
      end
    end

    def to_s
      fs = @fields.collect { |k, f| "  #{f.to_s}" }.join ",\n"
      "@#{@type}{#{@key},\n#{fs}\n}\n\n"
    end
  end

  # Different types of entries
  module EntryType
    Book = 'book'
  end
  
end
