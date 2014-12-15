describe 'filter', () ->

  orderAgeFilter = null
  persons = null

  beforeEach module('app.filter')
  beforeEach inject (_orderAgeFilter_) ->
    orderAgeFilter = _orderAgeFilter_

    persons = [
      age: 20
      name: '1'
    ,
      age: 15
      name: '2'
    ,
      age: 26
      name: '3'
    ]

  it 'should order by age', () ->
    expect(orderAgeFilter(persons)[0].age).toBe(15)
    expect(orderAgeFilter(persons)[1].age).toBe(20)
    expect(orderAgeFilter(persons)[2].age).toBe(26)
    
