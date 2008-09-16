module SourceControl
  class Git
    class Revision < AbstractRevision

      attr_reader :number, :author, :time 

      def initialize(number, author, time)
        @number, @author, @time = number, author, time
      end

      def to_s
        <<-EOL
Revision #{number} committed by #{author} on #{time.strftime('%Y-%m-%d %H:%M:%S') if time}
        EOL
      end

      def ==(other)
        other.is_a?(Git::Revision) && number == other.number
      end

    end
  end
end
