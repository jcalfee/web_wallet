servicesModule = angular.module("app.services")
servicesModule.factory "RpcService", ($http) ->
  RpcService =
    request: (method, params) ->
      reqparams = {method: method, params: params || []}
      http_params =
        method: "POST",
        cache: false,
        url: '/rpc'
        data:
          jsonrpc: "2.0"
          id: 1
      angular.extend(http_params.data, reqparams)
      $http(http_params).then (response) ->
        #console.log "RpcService <#{http_params.data.method}> response:", response
        response.data or response
