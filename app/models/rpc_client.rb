class RpcClient
  def initialize
    @svc = BERTRPC::Service.new(ENV.fetch('RPC_HOST'), ENV.fetch('RPC_PORT'))
  end

  # If an error occurs, we will retry in 5 seconds. This can be used for
  # managing an RPC server being down, or for network blips
  def method_missing(method, *args)
    method_args = args.map { |arg| YAML.dump(arg) }
    YAML.load(@svc.call.coordinator.send(method, *method_args))
  rescue BERTRPC::UserError => e
    sleep(5)
    retry
  rescue BERTRPC::ConnectionError, BERTRPC::ReadError => e
    sleep(5)
    retry
  end
end
