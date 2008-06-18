#!/usr/bin/env ruby

#
# Run all the unit tests in the current directory.
#

require 'test/unit'

Dir.glob('BibTeX/test_*.rb').each do |file|
  require file
end

