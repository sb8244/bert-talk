require 'ernie'

module Plain
  def hello
    "world"
  end
end

Ernie.expose(:plain, Plain)
