class Code
    POSSIBLE_COLORS = 'RGBY'

    def initialize(str)
        @pegs = str.split("")
    end

    def self.valid_pegs?(str)
        return false if str == nil
        str.each_char.all? { |char| POSSIBLE_COLORS.include?(char)}
    end

    def self.random(length)
        str = ''

        while str.length < length
            random_color = POSSIBLE_COLORS[rand(0...POSSIBLE_COLORS.length)]
            str += random_color
        end

        Code.new(str)
    end

    def self.from_string(str)
        Code.new(str)
    end

    def length
        @pegs.length
    end

    def [] (idx)
        @pegs[idx]
    end

    def == (code)
        i = 0
        while i < code.length
            if code[i] != @pegs[i]
                return false
            end
            i += 1
        end
        true
    end

    ##### CONVERT THIS TO A .COUNT FUNCTION?
    def num_exact_matches(code)
        exact_matches = 0

        i = 0
        while i < code.length
            if code[i] == @pegs[i]
                exact_matches += 1
            end

            i += 1
        end

        exact_matches
    end

    def num_near_matches(code)
        near_matches = 0

        i = 0
        while i < code.length
            if @pegs.include?(code[i]) && (code[i] != @pegs[i])
                puts (code[i] != @pegs[i])
                near_matches += 1
            end

            i += 1
        end

        near_matches
    end

end
