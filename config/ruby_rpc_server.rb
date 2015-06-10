require 'ernie'

module Plain
  def hello
    "world"
  end

  @@counter = 0

  def count
    @@counter += 1
  end
end

Ernie.expose(:plain, Plain)
