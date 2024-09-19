Before running this configuration, start your application and Delve as described below.  Allow Delve to compile your application:
dlv debug --headless --listen=:2345 --api-version=2 --accept-multiclient
Or compile the application using Go 1.18 or newer:
go build -gcflags "all=-N -l" github.com/app/demo
and then run it with Delve using the following command:
dlv --listen=:2345 --headless=true --api-version=2 --accept-multiclient exec ./demo