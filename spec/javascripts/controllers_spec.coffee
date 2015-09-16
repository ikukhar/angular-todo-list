describe "Todo-list controllers", ->
  beforeEach module("todo-list")

  describe "ProjectsCtrl", -&gt;
    it "should set projects to an empty array", inject(($controller) ->
      scope = {}
      ctrl = $controller("ProjectsCtrl",
        $scope: scope
      )
      expect(scope.projects.length).toBe 0
    )
