angular.module('teamsApp').directive 'visitorNavigationBar', ->
  restrict: 'E'
  replace: true
  transclude: true
  templateUrl: 'assets/navigation-bar.html'
  controller: ($scope) ->

    $scope.links = [
      { path: 'teams',    name: 'Buscar Teams' }
    ]
