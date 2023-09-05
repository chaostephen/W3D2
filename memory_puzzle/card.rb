class Card
    attr_reader :shown, :value
    
    def initialize(value, shown)
        @value = value
        @shown = shown
    end

    def hide
        @shown = false
    end

    def reveal
        @shown = true
    end

    def to_s
    end

    def ==
    end
end