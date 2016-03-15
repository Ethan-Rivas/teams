angular.module('teamsApp')
  .service 'Player', ($http, $resource, APIResource) ->

    class Player extends APIResource
      @url: '/api/v1/players'
      @wrapper: 'player'
