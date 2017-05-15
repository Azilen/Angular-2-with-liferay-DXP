// Applicationn Main Component
(function(app) {
  app.AppComponent =
    ng.core.Component({
      selector: 'my-app', //Application Name
      template: '<h1>Hello World : Angular 2 App</h1>' //Template you can use <TemplateURL> also
    })
    .Class({
      constructor: function() {}
    });
})(window.app || (window.app = {}));