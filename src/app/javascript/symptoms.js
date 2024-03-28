// Import and register all your controllers from the importmap under controllers/*

import { application } from "controllers/application"

// Eager load all controllers defined in the import map under controllers/**/*_controller
document.addEventListener("DOMContentLoaded", function() {

    function loadExternalScript(url, callback) {
      var script = document.createElement('script');
      script.type = 'text/javascript';
      script.src = url;
      script.onload = callback;
      document.head.appendChild(script);
    }
  
  
    loadExternalScript('https://cdn.jsdelivr.net/gh/habibmhamadi/multi-select-tag@2.0.1/dist/js/multi-select-tag.js',
    function() {
      // The external library has been loaded, you can now use its functionality
      // Initialize MultiSelectTag here or wherever appropriate
      new MultiSelectTag( 'symptoms-dropdown ', {
        rounded: true,
        shadow: true,
        placeholder: 'Search',
        tagColor: {
          textColor: '#327b2c',
          borderColor: '#92e681',
          bgColor: '#eaffe6',
        },
        onChange: function(values) {
          console.log(values);
        }
      });
    });
  
  
    eagerLoadControllersFrom("controllers", application);
  });
  