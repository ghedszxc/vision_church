import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    discipleList: []
  },
  mutations: {
    GET_DISCIPLE_LIST: (state, payload) => {
      state.discipleList = payload
    }
  },
  actions: {
  },
  modules: {
  }
})
