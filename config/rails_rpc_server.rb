require 'ernie'
require File.expand_path('../environment', __FILE__)

# Rails will cause the encoding to slip to ASCII-8BIT for some reason.
# This works fine when all rails libraries aren't loaded onto the ernie process
class Ernie
  def self.write_berp(output, ruby)
    data = BERT.encode(ruby)
    output.write([data.length].pack("N").force_encoding("utf-8"))
    output.write(data.force_encoding("utf-8"))
  end
end

Ernie.expose(:with_rails, WithRails)

Ernie.auto_start = false

# I prefer to explicitly start it to eliminate any confusion in the future
at_exit do
  # NewRelic::Agent.manual_start
  Ernie.start
end
