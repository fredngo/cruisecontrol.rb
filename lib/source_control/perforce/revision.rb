module SourceControl
  class Perforce
    
    class Revision < AbstractRevision
      attr_accessor :number, :author, :time, :message, :changeset

      def initialize(number, options = {})
        @number = number
        options.each {|key, value| send("#{key}=", value) }
      end

      def ==(other)
        other.is_a?(Perforce::Revision) && number == other.number
      end

      def >(other)
        other.is_a?(Perforce::Revision) && number > other.number
      end
      
      def <(other)
        other.is_a?(Perforce::Revision) && number < other.number
      end
      
# I don't know what this does
      def files
#        changeset ? changeset.map{|change| change.gsub(/\|.*$/, '').strip} : []
      end

      def to_s
        description = "Revision ...#{number} committed by #{author}"
        description << " on #{time.strftime('%Y-%m-%d %H:%M:%S')}" if time
        description << "\n\n    #{message.split("\n").join("\n    ")}" if message
        description << "\n\n #{changeset.join("\n ")}" if changeset
        description << "\n"
      end

      def label
        self.number.to_s[0..7]
      end

    end
  end
end
