# Another option would be to add a hook that allows modification of
# default checks but it's 8pm on Friday night...
module Cane
  def default_checks
    [
      AbcCheck,
      StyleCheck,
      DocCheck,
      ThresholdCheck,
      LineEndingCheck
    ]
  end
  module_function :default_checks
end
