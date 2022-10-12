class Code
    POSSIBLE_PEGS = {
        "R" => :red,
        "G" => :green,
        "B" => :blue,
        "Y" => :yellow,
    }

    attr_reader :pegs

    def self.valid_pegs?(chars)
        # return false if str == nil
        chars.all? { |char| POSSIBLE_PEGS.has_key?(char.upcase)}
    end

def self.random(length)
        random_pegs = []

        while random_pegs.length < length
            random_color = POSSIBLE_PEGS.keys.sample
            random_pegs << random_color
        end

        Code.new(random_pegs)
    end

    def self.from_string(str)
        Code.new(str.split(""))
    end

    def initialize(chars)
        if Code.valid_pegs(chars)
            @pegs = chars.map(&:upcase)
        else
            raise "pegs are invalid"
        end
    end

    def [] (idx)
        @pegs[idx]
    end

    def length
        @pegs.length
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
    def num_exact_matches(guess_code)
        (0...guess_code.length).count { |i| guess_code[i] == @pegs[i] }
    end

    def num_near_matches(code)
        code_dup = self.pegs.dup
        guess_dup = guess_code.pegs.dup

        # Remove exact matches from both arrays
        guess_dup.each_with_index do |peg, i|
            if peg == code_dup[i]
                guess_dup[i] = nil
                code_dup[i] = nil
            end
        end
        code_dup.delete(nil)
        guess_dup.delete(nil)

        # Count near matches. Make sure that you aren't double counting by removing from code_dup sack when peg is found
        near_matches = 0
        guess_dup.each_with_index do |peg, i|
            if code_dup.include?(peg)
                near_matches += 1
                code_dup.delete_at(code_dup.index(peg))
            end

            i += 1
        end

        near_matches
    end

end
