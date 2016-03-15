angular.module('teamsApp').directive 'resourceForm', ($location) ->
  restrict: 'E'
  replace: true
  templateUrl: (tElement, tAttrs) ->
    "assets/forms/#{tAttrs.resource}"

  scope:
    resource: '='
    back:     '@'
    success:  '@'
    data:     '='

  controller: ($scope) ->
    # Expose the resource so it can be accessible inside the form-field directives.
    @resource = $scope.resource

    $scope.save = ->
      $scope.resource.$save().then ->
        $scope.resource.constructor.reload().then ->
          $location.path $scope.success

    return @
