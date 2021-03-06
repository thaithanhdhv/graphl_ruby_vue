import Vue from 'vue/dist/vue.esm'
import Vuex from 'vuex/dist/vuex.esm'
import author from './modules/author'

Vue.use(Vuex)

export default new Vuex.Store({
  strict: false,
  modules: {
    author
  }
})
