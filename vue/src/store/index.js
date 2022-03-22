import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    // GLOBAL
    snackBar: { snackbar: false, color: '', timeout: 3000, message: '' },

    // DISCIPLES
    discipleList: [],
    archivedDiscipleList: [],

    // EVENTS
    eventList: [],

    // ATTENDEES
    attendeeList: []
  },
  mutations: {
    // GLOBAL
    UPDATE_SNACKBAR: (state, payload) => {
      state.snackBar = payload
    },

    // DISCIPLES
    GET_DISCIPLE_LIST: (state, payload) => {
      state.discipleList = payload
    },
    GET_ARCHIVED_DISCIPLE_LIST: (state, payload) => {
      state.archivedDiscipleList = payload
    },

    // EVENTS
    GET_EVENT_LIST: (state, payload) => {
      state.eventList = payload
    },
    
    // ATTENDEES
    GET_ATTENDEE_LIST: (state, payload) => {
      state.attendeeList = payload
    },
  },
  actions: {
    // DISCIPLES
    addNewDisciple({commit, state},payload) {
      state.discipleList.push(payload)
      commit('UPDATE_SNACKBAR', { snackbar: true, color: 'success', message: `${payload.last_name}, ${payload.first_name} is registered.` })
    },
    updateDisciple({commit, state},payload) {
      let find_disciple = state.discipleList.findIndex(find => find.id == payload.id)
      
      if (find_disciple != -1) {
        state.discipleList[find_disciple] = payload
        commit('UPDATE_SNACKBAR', { snackbar: true, color: 'success', message: `${payload.last_name}, ${payload.first_name} information is updated.` })
      }
    },
    updateDiscipleList({commit, state},payload) {
      let find_disciple = state.discipleList.findIndex(find => find.id == payload)
      
      if (find_disciple != -1) {
        commit('UPDATE_SNACKBAR', { snackbar: true, color: 'success', message: `${state.discipleList[find_disciple].last_name}, ${state.discipleList[find_disciple].first_name} is inactive.` })
        state.discipleList.splice(find_disciple,1)
      }
    },

    // EVENTS
    addNewEvent({commit, state},payload) {
      state.eventList.push(payload)
      commit('UPDATE_SNACKBAR', { snackbar: true, color: 'success', message: `${payload.name} is created.` })
    },
    
    // ATTENDEES
    clearAttendee({state}) {
      state.attendeeList = []
    },
    removeAttendeeRow({state}, payload) {
      let find_index = state.attendeeList.findIndex(find => find.id == payload)
      find_index != -1 ? state.attendeeList.splice(find_index, 1) : null
    },
    addNewAttendee({state}, payload) {
      state.attendeeList.push({ id: payload })

      // state.eventList.push(payload)
      // commit('UPDATE_SNACKBAR', { snackbar: true, color: 'success', message: `${payload.name} is created.` })
    },
  },
  modules: {
  }
})
