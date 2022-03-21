<template>
    <div>
      <create-event></create-event>
      <v-calendar
        type="month"
        :weekdays="weekday"
        event-overlap-mode="stack"
        
        :events="events"
        @click:event="showEvent"
      ></v-calendar>

      <v-dialog v-model="eventInfoDialog" max-width="1000">
        <v-card>
          <v-card-title>
            {{selectedEvent.name}}
            <v-spacer></v-spacer>
            
            <v-btn class="info mr-2" @click="eventInfoDialog = false">
              Register 1T
            </v-btn>

            <v-btn class="error" @click="eventInfoDialog = false">
              Close
            </v-btn>
          </v-card-title>
          <v-card-text>
            <update-attendance :selectedEvent="selectedEvent"></update-attendance>
          </v-card-text>
        </v-card>
      </v-dialog>
    </div>
</template>
<script>
import createEvent from './actions/Add.vue'
import updateAttendance from './UpdateAttendance.vue'
export default {
  components: {
    'create-event': createEvent,
    'update-attendance': updateAttendance
  },
  data: () => ({
    selectedEvent: {},
    eventInfoDialog: false,

    events: [],
    weekday: [0, 1, 2, 3, 4, 5, 6],

    colors: ['blue', 'indigo', 'deep-purple', 'cyan', 'green', 'orange', 'grey darken-1'],
    names: ['Sundary 1st Service', 'Sundary 2nd Service', 'Evening Prayer', 'Extreme Net'],
  }),
  computed: {
    eventList(){
      return this.$store.state.eventList;
    }
  },
  mounted(){
    this.$http.get('api/event').then(response => {
      console.log(":D", response.body)
      this.$store.commit('GET_EVENT_LIST', response.body)

      response.body.map(data => {
        
        this.events.push({
          name: data.name,
          start: data.start,
          end: data.end,
          color: data.color,
          timed: true,
        })
      })
    })
  },
  methods: {
    showEvent({ event }){
      this.selectedEvent = event
      this.eventInfoDialog = true
    }
  }
}
</script>