angular.module('teamsApp')
  .controller('PlayersIndexCtrl', function($scope, Player){

    Player.load().then(function(players) {
      $scope.players = players;
    });

    $scope.delete = function(player) {
      if(!player.removing) {
        player.removing = true;
      }

        product.$deleteFrom($scope.products).then(function(players) {
          $scope.players = players;
        });

    };

  });
