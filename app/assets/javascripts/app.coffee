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

      when('/teams',             'teams').
      when('/teams/index',       'teams.index').
      when('/teams/nuevo',       'teams.nuevo').
      when('/teams/:id/editar',  'teams.editar').

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

      segment('teams',
        templateUrl: 'assets/teams.html'
      ).

        within().
          segment('index',
            templateUrl: 'assets/teams/index.html'
            #controller: 'TeamsIndexCtrl as ctrl'
            default: true
          ).

          segment('nuevo',
            templateUrl: 'assets/teams/nuevo.html'
            #controller: 'TeamsNewCtrl'
          ).

          segment('editar',
            templateUrl: 'assets/teams/editar.html'
            #controller: 'TeamsEditCtrl'
          ).

        up().
      up()

]
