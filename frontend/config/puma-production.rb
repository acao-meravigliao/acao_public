bind 'tcp://[::]:3001'

threads 8,32
workers 3
preload_app!
