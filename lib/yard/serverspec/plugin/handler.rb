require 'yard'

module YARD
  module CodeObjects
    # SpecObjectClass
    class SpecObject < MethodObject
      attr_accessor :target
      def type
        :method
      end
    end
  end

  module Handlers
    module Serverspec
      # AbstractSpecHandler
      module AbstractSpecHandler
        def process
          register_spec(target)
          parse_block(statement.last.last)
        end

        def register_file
          file_name = parser.file.split('/').last.gsub('_spec.rb', '')
          CodeObjects::ClassObject.new(namespace, file_name)
        end

        def register_spec(target, _doc = nil)
          register CodeObjects::SpecObject.new(register_file, target.source, :instance) do |o|
            o.visibility = 'public'
            o.source     = statement.source
            o.signature  = target.source
            o.explicit   = true
            o.docstring  = statement.comments
          end
        end
      end

      # Describe handler for YARD's source parser.
      class DescribeHandler < Ruby::Base
        include AbstractSpecHandler
        handles method_call(:describe)
        handles method_call(:context)

        def target
          statement.parameters.first
        end
      end
    end
  end
end
