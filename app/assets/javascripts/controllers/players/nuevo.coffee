angular.module('teamsApp').controller 'PlayersNewCtrl', [
  '$scope', 'Player', '$location', ($scope, Player, $location) ->

    $scope.player = new Player(name: '')
]
