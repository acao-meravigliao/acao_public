bind 'tcp://[::]:3101'

threads 8,32
workers 3
preload_app!

state_path 'log/puma.state'
pidfile 'log/puma.pid'
