import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    discipleList: [],
    eventList: []
  },
  mutations: {
    GET_DISCIPLE_LIST: (state, payload) => {
      state.discipleList = payload
    },
    GET_EVENT_LIST: (state, payload) => {
      state.eventList = payload
    },
  },
  actions: {
  },
  modules: {
  }
})
