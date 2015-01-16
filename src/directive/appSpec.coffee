describe 'directive', () ->

  scope = null
  $compile = null
  element = null
  tab = null

  titles = () ->
    return $(element).find('ul.nav-tabs li')

  contents = () ->
    return $(element).find('div.tab-content div.tab-pane')

  hrefs = () ->
    return titles().find('a')

  beforeEach(module('app.directive'))

  beforeEach(inject(($rootScope, _$compile_) ->

    scope = $rootScope
    $compile = _$compile_

    element = angular.element('
      <tabset>
        <tab class="active" heading="tab1">content1</tab>
        <tab heading="tab2">content2</tab>
      </tabset>
    ')

    tab = $compile(element)(scope)

    scope.$digest()
  
  ))

  it 'should generate tab', () ->

    expect(element.find('ul')).toHaveClass('nav-tabs')

  it 'should generate two tabs', () ->

    expect(titles().length).toEqual(2)
    expect(contents().length).toEqual(2)

  it 'should create two titles', () ->

    expect(hrefs().eq(0).text()).toEqual('tab1')
    expect(hrefs().eq(1).text()).toEqual('tab2')

  it 'should active the first tab and first content', () ->

    expect(titles().eq(0)).toHaveClass('active')
    expect(titles().eq(1)).not.toHaveClass('active')
    expect(contents().eq(0)).toHaveClass('active')
    expect(contents().eq(1)).not.toHaveClass('active')

