# Parse text files that are just lists with no frequency data
class Yuzuki
  # Parse text files that are just lists with no frequency data
  class FrequencyAnalyzer
    JAPANESE_FILENAME = '/Users/agrimm/ruby/wip/enamdict_parser/results/japanese_names_20150322a.txt'
    NON_JAPANESE_FILENAME = '/Users/agrimm/ruby/wip/enamdict_parser/results/non_japanese_names_20150322a.txt'
    def self.new_using_configuration
      japanese_names = File.read(JAPANESE_FILENAME).split("\n")
      non_japanese_names = File.read(NON_JAPANESE_FILENAME).split("\n")
      new(japanese_names, non_japanese_names)
    end

    def initialize(japanese_names, non_japanese_names)
      @japanese_names = Set.new(japanese_names.map(&:downcase))
      @non_japanese_names = Set.new(non_japanese_names.map(&:downcase))
    end

    def predominantly_japanese?(word)
      downcased_word = word.downcase
      @japanese_names.include?(downcased_word) &&
        !@non_japanese_names.include?(downcased_word)
    end
  end
end
