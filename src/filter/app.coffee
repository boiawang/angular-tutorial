angular.module 'app.filter', []

.filter 'orderAge', [() ->
  return (persons) ->
    return persons.sort (left, right) ->
      a = left.age
      b = right.age

      if a isnt b
        if a > b
          return 1
        if a < b
          return -1
]

.controller 'FilterController', ['$scope', ($scope) ->
  $scope.persons = [
    name: 'green'
    age: 25
    createTime: '2012-10-10T06:11:32Z'
    phone: 13183284234
    money: 12.347878
  ,
    name: 'wood'
    age: 15
    createTime: '2014-10-10T17:11:42Z'
    phone: 13183284244
    money: 23.48578
  ,
    name: 'evan'
    age: 35
    createTime: '2013-11-03T16:15:02Z'
    phone: 13183284264
    money: 8.348777
  ,
    name: 'jackson'
    age: 17
    createTime: '2013-12-01T06:11:32Z'
    phone: 13183528092
    money: 3.494588
  ,
    name: 'clarke'
    age: 33
    createTime: '2012-08-03T11:11:11Z'
    phone: 13182936347
    money: 45.3874787
  ]
]
