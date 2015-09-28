module.exports = function(config) {
  config.set({
    basePath: '../..',

    frameworks: ['jasmine'],

    autoWatch: true,

    preprocessors: {
      '**/*.coffee': 'coffee'
    },

    files: [
      'angular/angular.js',
      'angular-mocks/angular-mocks.js',
      'app/assets/javascripts/app/*',
      'spec/javascripts/*_spec.js.coffee'
    ]
  });
};
