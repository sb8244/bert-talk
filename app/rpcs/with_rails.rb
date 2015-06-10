module RpcController
  protected

  def respond_over_rpc(resp)
    YAML.dump resp
  end

  def param(arg)
    YAML.load arg
  end
end

module WithRails
  include RpcController

  def hello
    "world"
  end

  def add_widget(name)
    Widget.create!(name: name)
    true
  end

  def widget_count
    Widget.count
  end

  def first_widget_fails
    Widget.first
  end

  def first_widget_passes
    YAML.dump Widget.first
  end

  def get_job
    respond_over_rpc MrPassoff.new(Widget.first)
  end

  def push_result(job)
    job = param(job)
    job.finalize
  end
end
