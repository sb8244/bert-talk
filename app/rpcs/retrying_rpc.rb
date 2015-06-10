module BeforeFilter
  def before(*names)
    names.each do |name|
      m = instance_method(name)
      define_method(name) do |*args, &block|
        yield
        m.bind(self).(*args, &block)
      end
    end
  end
end

module RetryingRpc
  extend BeforeFilter

  def my_method
    "something"
  end

  private

  before(*public_instance_methods) do
    unless ActiveRecord::Base.connection.active?
      ActiveRecord::Base.clear_all_connections!
      ActiveRecord::Base.connection.reconnect!
    end
  end
end
