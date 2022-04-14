import Vue from 'vue'
import Vuex from 'vuex'
Vue.use(Vuex)

export default {
  namespaced: true,
  state: {
    userList: []
  },
  mutations: {
    GET_USER_LIST: (state, payload) => {
      state.userList = payload
    },
    ADD_NEW_USER: (state, payload) => {
      state.userList.push(payload)
    },
  },
  actions: {

  }
}
