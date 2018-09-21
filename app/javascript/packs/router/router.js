import Vue from 'vue/dist/vue.esm.js'
import VueRouter from 'vue-router'

import Home from '../components/index.vue'

Vue.use(VueRouter)

export default new VueRouter({
  mode: 'history',
  routes: [
    { path: '/', component: Home },
  ],
})
