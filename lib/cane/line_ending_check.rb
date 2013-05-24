module Cane
  # Creates violations for files that do not end with a new line
  # character.
  class LineEndingCheck < Struct.new(:opts)
    def self.key; :line_ending; end
    def self.name; "line ending checking"; end
    def self.options
      {
        line_ending_glob: [
          'Glob to run line ending checks over',
          default:  '{app,config,lib,test}/**/*.{rb,yml,erb,js,css,sass}',
          variable: 'GLOB',
          clobber:  :no_line_ending
        ],
        no_line_ending:   [
                            'Disable line ending checking',
                            cast: ->(x) { !x }
                          ]
      }
    end

    def violations
      worker.map(file_list) do |file_path|
        unless includes_new_line_character? file_path
          {
            file: file_path,
            line: iterator(file_path).count,
            label: "File does not include a new line character at end of file",
            description: "File violated line ending requirement"
          }
        end
      end.compact
    end

    protected

    def iterator file_path
      Cane::File.iterator file_path
    end

    def file_list
      Dir[opts.fetch(:line_ending_glob)]
    end

    def includes_new_line_character? file_path
      iterator(file_path).all? { |line| line =~ /\n\Z/ }
    end

    def worker
      Cane.task_runner opts
    end
  end
end
