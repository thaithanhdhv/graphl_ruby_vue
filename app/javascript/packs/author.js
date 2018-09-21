import Vue from 'vue/dist/vue.esm'
import Router from './router/router'
import Header from './components/header.vue'
import store from './store/index'
var app = new Vue({
  el: '#app',
  router: Router,
  components: {
    'navbar': Header
  },
  store
});
