<template>
    <div>
      <create-event></create-event>
      <v-calendar
        type="month"
        :weekdays="weekday"
        event-overlap-mode="stack"
        
        :events="eventList"
        @click:event="showEvent"
      ></v-calendar>

      <v-dialog v-model="eventInfoDialog" max-width="1300">
        <v-card>
          <v-card-title :style="{ color: selectedEvent.color }">
            {{selectedEvent.name}}
            <v-spacer></v-spacer>
            
            <add-disciple :title_text="'Register 1T'"></add-disciple>
            <!-- <add-attendee :title_text="'Register 1T'"></add-attendee> -->
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
// import addAttendee from './actions/AddAttendee.vue'
import addDisciple from '../report/actions/Add.vue'
import updateAttendance from './UpdateAttendance.vue'
export default {
  components: {
    // 'add-attendee': addAttendee,
    'create-event': createEvent,
    'add-disciple': addDisciple,
    'update-attendance': updateAttendance
  },
  data: () => ({
    selectedEvent: {},
    eventInfoDialog: false,

    // events: [],
    weekday: [0, 1, 2, 3, 4, 5, 6],
    names: ['Sundary 1st Service', 'Sundary 2nd Service', 'Evening Prayer', 'Extreme Net'],
  }),
  computed: {
    eventList(){
      return this.$store.state.eventList;
    }
  },
  mounted(){
    this.$http.get('api/event').then(response => {
      this.$store.commit('GET_EVENT_LIST', response.body)
    })
  },
  methods: {
    showEvent({ event }){
      this.$http.get(`api/attendee/${event.id}`).then(response => {
        console.log("RES: ", response.body)
        
        this.selectedEvent = event
        this.eventInfoDialog = true
      })
    }
  }
}
</script>