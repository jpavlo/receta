receta = angular.module('receta',[
  'templates',
  'ngRoute',
  'controllers',
])

receta.config([ '$routeProvider',
  ($routeProvider)->
    $routeProvider
      .when('/',
        templateUrl: "index.html"
        controller: 'RecipesController'
      )
])

recipes = [
  {
    id: 1
    name: 'Baked Potato w/ MCheese'
  },
  {
    id: 2
    name: 'Garlic Mashed MPotatoes',
  },
  {
    id: 3
    name: 'Potatoes Au MGratin',
  },
  {
    id: 4
    name: 'Baked Brussel MSprouts',
  },
]
controllers = angular.module('controllers',[])
controllers.controller("RecipesController", [ '$scope', '$routeParams', '$location',
  ($scope,$routeParams,$location)->
    $scope.search = (keywords)->  $location.path("/").search('keywords',keywords)

    if $routeParams.keywords
      keywords = $routeParams.keywords.toLowerCase()
      $scope.recipes = recipes.filter (recipe)-> recipe.name.toLowerCase().indexOf(keywords) != -1
    else
      $scope.recipes = []
])
