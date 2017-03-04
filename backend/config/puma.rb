bind 'tcp://[::]:3100'

threads 8,32
workers 1
preload_app!

require 'actor_model'
require_relative '../../../yggdra/plugins/amqp_ws_gw/app/lib/ygg/amqp_ws_gw'
require_relative '../../../yggdra/plugins/amqp_ws_gw/app/lib/ygg/amqp_ws_gw/ws_connection'
require_relative '../../../yggdra/plugins/amqp_ws_gw/app/lib/ygg/amqp_ws_gw/gateway'

on_worker_boot do
  RailsActorModel::Logger.new

  Ygg::AmqpWsGw.start

  ActiveSupport.on_load(:active_record) do
    ActiveRecord::Base.establish_connection
  end
end
