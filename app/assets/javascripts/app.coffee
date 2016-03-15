angular
  .module('teamsApp', [
    'ngResource', 'ngRoute',
    'route-segment', 'view-segment'
  ])
  .config ['$httpProvider', '$routeSegmentProvider', ($httpProvider, $routeSegmentProvider) ->

    $httpProvider.defaults.headers.common['X-CSRF-Token'] =
      document.querySelector('meta[name=csrf-token]').content

    $routeSegmentProvider.
      when('/players',             'players').
      when('/players/index',       'players.index').
      when('/players/nuevo',       'players.nuevo').
      when('/players/:id/editar',  'players.editar').

      segment('players',
        templateUrl: 'assets/players.html'
      ).

        within().
          segment('index',
            templateUrl: 'assets/players/index.html'
            controller: 'PlayersIndexCtrl as ctrl'
            default: true
          ).

          segment('nuevo',
            templateUrl: 'assets/players/nuevo.html'
            controller: 'PlayersNewCtrl'
          ).

          segment('editar',
            templateUrl: 'assets/players/editar.html'
            controller: 'PlayersEditCtrl'
          ).

        up().
      up()

]
