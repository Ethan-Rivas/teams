angular.module('teamsApp').service 'APIResource', ($http) ->

    class APIResource
      # This is intended to be overwritten by services
      @url: undefined

      @wrapper: undefined

      @load: ->
        @all || @reload()

      @reload: ->
        @all = $http.get(@url).then (response) =>
          response.data.map (attributes) =>
            new @(attributes)

      @find: (id) ->
        @load().then (resources) =>
          (resources.filter (resource) =>
            resource.attributes.id == parseInt(id)
          )[0]

      constructor: (attributes = {}) ->
        @attributes = attributes
        @errors     = {}

        assign = (key) =>
          (resource) =>
            @[key] = resource

        for key of @associations
          @associations[key].find(@attributes["#{key}_id"]).then assign(key)

      $save: =>
        @errors = {}

        pResolve = undefined
        promise = new Promise (resolve) ->
          pResolve = resolve

        if @attributes.id
          saveFn = '$update'
        else
          saveFn = '$create'

        @[saveFn]()
          .then (response) =>
            pResolve(response)

          .catch (response) =>
            @errors = response.data.errors

        return promise

      payload: =>
        if @constructor.wrapper
          payload = {}
          payload[@constructor.wrapper] = @attributes
        else
          payload = @attributes
        return payload


      $create: =>
        $http.post(@constructor.url, @payload())

      $update: =>
        $http.put(@url(), @payload())

      url: => "#{@constructor.url}/#{@attributes.id}"

      $deleteFrom: (array) =>
        $http.delete(@url()).then =>
          array.filter (resource) =>
            resource.attributes.id != @attributes.id
