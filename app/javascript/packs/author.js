import Vue from 'vue/dist/vue.esm'
import Router from './router/router'
import Header from './components/header.vue'
import Author from './components/index.vue'
var app = new Vue({
  el: '#app',
  router: Router,
  components: {
    'navbar': Header,
    'appAuthor': Author
  }
});
