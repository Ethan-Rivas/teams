angular.module('teamsApp').directive 'navigationBar', ->
  restrict: 'E'
  replace: true
  transclude: true
  templateUrl: 'assets/navigation-bar.html'
  controller: ($scope) ->

    $scope.links = [
      { path: 'players',    name: 'Players' }
      { path: 'teams',    name: 'Crear Team' }
    ]
