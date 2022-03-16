<template>
    <div>
      <create-event></create-event>
      <v-calendar
        ref="calendar"
        v-model="value"
        :weekdays="weekday"
        :type="type"
        :events="events"
        :event-overlap-mode="mode"
        :event-overlap-threshold="30"
        :event-color="getEventColor"
        @change="getEvents"
      ></v-calendar>
    </div>
</template>
<script>
import createEvent from './actions/Add.vue'
export default {
  components: {
    'create-event': createEvent
  },
  data: () => ({
    type: 'month',

    mode: 'stack',
    weekday: [0, 1, 2, 3, 4, 5, 6],

    value: '',
    events: [],
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
    getEvents ({ start, end }) {
      // const events = []

      // const min = new Date(`${start.date}T00:00:00`)
      // const max = new Date(`${end.date}T23:59:59`)
      // const days = (max.getTime() - min.getTime()) / 86400000
      // const eventCount = this.rnd(days, days + 20)

      // for (let i = 0; i < eventCount; i++) {
      //   const allDay = this.rnd(0, 3) === 0
      //   const firstTimestamp = this.rnd(min.getTime(), max.getTime())
      //   const first = new Date(firstTimestamp - (firstTimestamp % 900000))
      //   const secondTimestamp = this.rnd(2, allDay ? 288 : 8) * 900000
      //   const second = new Date(first.getTime() + secondTimestamp)

      //   console.log("??", allDay)
      //   events.push({
      //     name: this.names[this.rnd(0, this.names.length - 1)],
      //     start: first,
      //     end: second,
      //     color: this.colors[this.rnd(0, this.colors.length - 1)],
      //     timed: !allDay,
      //   })
      // }
      // this.events = events

      console.log("start: ", start)
      console.log("end: ", end)
      // this.events.push({
      //   name: this.names[0],
      //   start: '2022-03-16 00:15',
      //   end: '2022-03-16 12:00',
      //   color: this.colors[this.rnd(0, this.colors.length - 1)],
      //   timed: true,
      // })
    },
    getEventColor (event) {
      return event.color
    },
    rnd (a, b) {
      return Math.floor((b - a + 1) * Math.random()) + a
    },
  }
}
</script>