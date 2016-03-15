angular.module('teamsApp').directive 'formField', ->
  restrict: 'E'
  replace: true
  templateUrl: 'assets/form-field.html'
  scope:
    label:     '@'
    attribute: '@'
    type:      '@'
    optionsService: '@'
    optionsLabel:   '@'

  require: '^resourceForm'
  link: (scope, element, attrs, formCtrl) ->
    # Inherit resource object from form parent
    scope.resource = formCtrl.resource

    # If no type is provided default to text
    scope.type ||= 'text'

    # Calendar is not open for default
    scope.calendarOpened = false

    # Open calendar on click
    scope.openCalendar = ->
       scope.calendarOpened = !scope.calendarOpened
