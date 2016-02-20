bind 'tcp://[::]:3330'

threads 8,32
workers 3
preload_app!

state_path 'log/puma.state'
pidfile 'log/puma.pid'

on_worker_boot do
  ActiveSupport.on_load(:active_record) do
    ActiveRecord::Base.establish_connection
  end
end
