angular.module 'app.directive', []

.run ['$templateCache', ($templateCache) ->
  $templateCache.put('tabset.html', '
    <div>
      <ul class="nav nav-tabs"> 
        <li ng-repeat="tab in tabs track by $index" ng-class="{active: tab.active}">
          <a href="#" ng-click="selectTab(tab)">{{tab.heading}}</a>
        </li>
      </ul>  
      <div class="tab-content" ng-transclude></div>
    </div>
  ')
]

.run ['$templateCache', ($templateCache) ->
  $templateCache.put('tab.html', '
    <div class="tab-pane" ng-class="{active: active}" ng-transclude></div>
  ')
]

.directive 'tabset', [() ->
  return {
    restrict: 'E'
    transclude: true
    replace: true
    scope: {}
    controller: ($scope, $element) ->
      tabs = $scope.tabs = []

      $scope.selectTab = (tab) ->
        angular.forEach(tabs, (tab) ->
          tab.active = false
        )
        tab.active = true

      this.addTab = (tab) ->
        tabs.push(tab)

    templateUrl: 'tabset.html'
  }
]

.directive 'tab', [() ->
  return {
    require: '^tabset'
    link: (scope, element, attrs, ctrl) ->
      scope.active = element.hasClass('active')
      ctrl.addTab(scope)
    restrict: 'E'
    replace: true
    transclude: true
    scope:
      heading: '@'
    templateUrl: 'tab.html'
  }
]

