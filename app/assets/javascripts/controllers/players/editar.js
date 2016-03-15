angular.module('teamsApp')
  .controller('PlayersEditCtrl', function($scope, $location, $routeParams, Player) {

    Player.find($routeParams.id).then(function(player) {
      $scope.player = player;
    });

  });
