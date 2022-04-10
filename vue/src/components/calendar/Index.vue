<template>
    <div>
      <v-card flat>
        <v-card-title>
          <v-tabs v-model="showTab">
            <v-tab href="#1">
              Event for {{!calendarMonth ? months[getTimestamp().split("-")[1]] : months[calendarMonth.split("-")[1]]}}
            </v-tab>
            <v-spacer></v-spacer>
            <create-event class="mt-2 hidden-sm-and-down"></create-event>
          </v-tabs>
        </v-card-title>

        <v-layout>
          <v-flex xs12 md9>
            <v-btn icon class="primary mx-4"
              @click="$refs.calendar.prev()">
              <v-icon color="white">mdi-chevron-left</v-icon>
            </v-btn>
            
            <v-btn icon class="primary"
              @click="$refs.calendar.next()">
              <v-icon color="white">mdi-chevron-right</v-icon>
            </v-btn>
          </v-flex>
          <v-flex xs12 md3 class="hidden-md-and-up mr-4">
            <create-event></create-event>
          </v-flex>
        </v-layout>
        
        <v-card-text>
          <v-calendar
            v-model="calendarMonth"
            ref="calendar"
            type="month"
            :weekdays="weekday"
            event-overlap-mode="stack"
            
            :events="eventList"
            @click:event="showEvent"
          ></v-calendar>
        </v-card-text>
      </v-card>


      <v-dialog v-model="eventInfoDialog" max-width="1500">
        <v-card v-if="loadingPage">
          <v-card-title :style="{ color: selectedEvent.color }">
            {{selectedEvent.name}}
            <v-spacer></v-spacer>
            
            <add-disciple :title_text="'Register 1T'" :event_id="selectedEvent.id"></add-disciple> <!-- :checkTodayDisabled="checkTodayDisabled()" -->
            <v-btn class="error" @click="onHideEventInfoDialog()">
              Close
            </v-btn>
          </v-card-title>
          <v-card-text>
            <v-layout wrap class="mt-5">
              <v-flex xs12 md9>
                <v-layout wrap>
                  <v-flex xs12 class="mb-5">
                    <span class="overline ml-3">Attendees</span>
                    <v-divider style="margin: -1.7% 3% 0% 12%;"></v-divider>
                  </v-flex>
                  <v-flex xs12>
                    <v-btn small rounded class="primary mx-2" @click="newAttendee()"
                      :text="attendees.length != discipleList.length"
                      :disabled="attendeeList.length == discipleList.length"> <!--  || checkTodayDisabled() -->
                      Add Attendee
                    </v-btn>

                    <v-btn small rounded text class="success" @click="updateAttendanceDialog = true"
                      :disabled="!attendees.length ? true : false"> <!--  || checkTodayDisabled() -->
                      Update Attendance
                    </v-btn>
                  </v-flex>
                  <v-flex xs12 style="margin-right: 3%;">
                    <v-data-table :headers="headers" :items="attendeeList">

                      <template v-slot:item.status="{ item }">
                        <v-chip v-if="discipleList.find(find => find.id == item.id)"
                          :color="discipleList.find(find => find.id == item.id) ? statusList.find(find => find.id == discipleList.find(find => find.id == item.id).status).color : ''">
                          {{
                            discipleList.find(find => find.id == item.id) ?
                            statusList.find(find => find.id == discipleList.find(find => find.id == item.id).status).text : ''
                          }}
                        </v-chip>
                        <v-btn v-else icon @click="$store.dispatch('removeAttendeeRow', item.id)">
                          <v-icon color="error">mdi-delete</v-icon>
                        </v-btn>
                      </template>

                      <template v-slot:item.id="{ item }">
                          <v-autocomplete v-if="!item.id"
                            v-model="item.id"
                            placeholder="Name"
                            label="Name"
                            dense hide-details
                            class="my-3 mt-4"

                            @input="insertDiscipleId(item.id)"
                            :items="discipleListFilter"
                            item-text="full_name"
                            item-value="id">
                          </v-autocomplete>

                          <span class="text-truncate" v-else>
                            {{discipleList.find(find => find.id == item.id) ? `${discipleList.find(find => find.id == item.id).last_name}, ${discipleList.find(find => find.id == item.id).first_name}` : ''}}
                          </span>
                      </template>


                      <template v-slot:item.network="{ item }">
                        {{
                          discipleList.find(find => find.id == item.id) ?
                          networkList.find(find => find.id == discipleList.find(find => find.id == item.id).network).text : ''
                        }}
                      </template>

                      <template v-slot:item.cell_leader_id="{ item }">
                        <span class="text-truncate">
                          {{
                            item.id && discipleList.find(find => find.id == discipleList.find(find => find.id == item.id).cell_leader_id) ?
                            `${discipleList.find(find => find.id == discipleList.find(find => find.id == item.id).cell_leader_id).last_name}, ${discipleList.find(find => find.id == discipleList.find(find => find.id == item.id).cell_leader_id).first_name}` : ''
                          }}
                        </span>
                      </template>
                      
                      <template v-slot:item.primary_leader_id="{ item }">
                        <span class="text-truncate">
                          {{
                            item.id && discipleList.find(find => find.id == discipleList.find(find => find.id == item.id).primary_leader_id) ?
                            `${discipleList.find(find => find.id == discipleList.find(find => find.id == item.id).primary_leader_id).last_name}, ${discipleList.find(find => find.id == discipleList.find(find => find.id == item.id).primary_leader_id).first_name}` : ''
                          }}
                        </span>
                      </template>

                    </v-data-table>
                  </v-flex>
                </v-layout>
              </v-flex>
              <v-flex xs12 md3>
                <v-layout wrap>
                  <v-flex xs12>
                    <span class="overline ml-3">Summary</span>
                    <v-divider style="margin: -5.5% 0% 0% 32%;"></v-divider>
                  </v-flex>
                  <v-list dense style="width: 100%; margin-top: 10px;">
                    <!-- FIRST TIMER -->
                    <v-list-item>
                      <v-list-item-content>
                        <v-list-item-title>
                          1st timer
                        </v-list-item-title>
                      </v-list-item-content>
                        <v-list-item-icon>
                          <v-chip color="error" small>
                            {{discipleList.filter(find => attendeeList.find(key => key.id == find.id) && find.status == 0).length}}
                          </v-chip>
                        </v-list-item-icon>
                    </v-list-item>
                    <v-divider class="ml-4"></v-divider>

                    <!-- SECOND TIMER -->
                    <v-list-item>
                      <v-list-item-content>
                        <v-list-item-title>
                          2nd timer
                        </v-list-item-title>
                      </v-list-item-content>
                        <v-list-item-icon>
                          <v-chip color="secondary" small>
                            {{discipleList.filter(find => attendeeList.find(key => key.id == find.id) && find.status == 1).length}}
                          </v-chip>
                        </v-list-item-icon>
                    </v-list-item>
                    <v-divider class="ml-4"></v-divider>
                      
                    <!-- THIRD TIMER -->
                    <v-list-item>
                      <v-list-item-content>
                        <v-list-item-title>
                          3rd timer
                        </v-list-item-title>
                      </v-list-item-content>
                        <v-list-item-icon>
                          <v-chip color="success" small>
                            {{discipleList.filter(find => attendeeList.find(key => key.id == find.id) && find.status == 2).length}}
                          </v-chip>
                        </v-list-item-icon>
                    </v-list-item>
                    <v-divider class="ml-4"></v-divider>

                    <!-- FORTH TIMER -->
                    <v-list-item>
                      <v-list-item-content>
                        <v-list-item-title>
                          4th timer
                        </v-list-item-title>
                      </v-list-item-content>
                        <v-list-item-icon>
                          <v-chip color="warning" small>
                            {{discipleList.filter(find => attendeeList.find(key => key.id == find.id) && find.status == 3).length}}
                          </v-chip>
                        </v-list-item-icon>
                    </v-list-item>
                    <v-divider class="ml-4"></v-divider>
                    
                    <!-- FIFTH TIMER -->
                    <v-list-item>
                      <v-list-item-content>
                        <v-list-item-title>
                          5th timer
                        </v-list-item-title>
                      </v-list-item-content>
                        <v-list-item-icon>
                          <v-chip color="accent" small>
                            {{discipleList.filter(find => attendeeList.find(key => key.id == find.id) && find.status == 4).length}}
                          </v-chip>
                        </v-list-item-icon>
                    </v-list-item>
                    <v-divider class="ml-4"></v-divider>
                    
                    <!-- RD -->
                    <v-list-item>
                      <v-list-item-content>
                        <v-list-item-title>
                          RD
                        </v-list-item-title>
                      </v-list-item-content>
                        <v-list-item-icon>
                          <v-chip color="primary" small>
                            {{discipleList.filter(find => attendeeList.find(key => key.id == find.id) && find.status == 5).length}}
                          </v-chip>
                        </v-list-item-icon>
                    </v-list-item>
                    <v-divider class="ml-4"></v-divider>
                  </v-list>
                </v-layout>
              </v-flex>
            </v-layout>
          </v-card-text>
        </v-card>
        <v-card v-else>
          <v-card-text class="text-center" style="padding: 5% 20% 5% 20%;">
            <div class="mb-4 overline">Loading data <br class="hidden-md-and-up"> please wait ...</div>
            <v-progress-linear indeterminate size="64" height="10"></v-progress-linear>
          </v-card-text>
        </v-card>
      </v-dialog>
      
      <v-dialog v-model="updateAttendanceDialog" persistent max-width="500">
        <v-card>
          <v-card-title>
            <v-icon color="warning" class="mr-2">mdi-alert</v-icon>
            Confirmation
          </v-card-title>
          <v-card-text class="mt-4">
            <span v-if="!formDisabled">
              Are you sure you want to update attendees of {{selectedEvent ? selectedEvent.name : ''}}?
            </span>
            <div v-else class="text-center">
              <div class="mb-4 overline">Processing please wait ...</div>
              <v-progress-linear indeterminate size="64" height="5"></v-progress-linear>
            </div>
          </v-card-text>
          <v-card-actions>
            <v-spacer></v-spacer>
            <v-btn class="success" @click="updateEventAttendance()" :disabled="formDisabled">
              Yes
            </v-btn>
            <v-btn class="error" @click="updateAttendanceDialog = false" :disabled="formDisabled">
              No
            </v-btn>
          </v-card-actions>
        </v-card>
      </v-dialog>
    </div>
</template>
<script>
import createEvent from './actions/AddEvent.vue'
import addDisciple from '../report/actions/Add.vue'
export default {
  components: {
    'create-event': createEvent,
    'add-disciple': addDisciple
  },
  data: () => ({
    calendarMonth: '',

    showTab: 1,
    loadingPage: false,

    selectedEvent: {},
    eventInfoDialog: false,
    weekday: [0, 1, 2, 3, 4, 5, 6],
    names: ['Sundary 1st Service', 'Sundary 2nd Service', 'Evening Prayer', 'Extreme Net'],


    months: {
      '01': 'January',
      '02': 'February',
      '03': 'March',
      '04': 'April',
      '05': 'May',
      '06': 'June',
      '07': 'July',
      '08': 'August',
      '09': 'September',
      '10': 'October',
      '11': 'November',
      '12': 'December'
    },

    
    attendees: [],
    headers: [
      { text: 'Status', value: 'status', sortable: false },
      { text: 'Name', value: 'id', sortable: false },
      { text: 'Network', value: 'network', sortable: false },

      { text: 'Cell Leader', value: 'cell_leader_id', sortable: false },
      { text: 'Primary Leader', value: 'primary_leader_id', sortable: false }
    ],

    updateAttendanceDialog: false
  }),
  computed: {
    discipleListFilter(){
      let unique_ids = [...new Set(this.attendeeList.map(value => value.id))].filter(Number)
      // let unique_ids = [...new Set(this.attendees.concat(this.attendeeList).map(value => value.id))].filter(Number)
      return this.$store.state.discipleList.filter(find => unique_ids.findIndex(key => key == find.id) == -1)
    },
    attendeeList(){
      return this.$store.state.attendeeList;
    }
  },
  mounted(){
    this.$http.get('api/event').then(res => { this.$store.commit('GET_EVENT_LIST', res.body) }) // GET ALL EVENTS
    this.$http.get('api/disciple').then(res => { this.$store.commit('GET_DISCIPLE_LIST', res.body) }) // GET ALL DISCIPLES
  },
  methods: {
    showEvent({ event }){
      this.$store.dispatch('clearAttendee')

      // GET ATTENDEES OF SELECTED EVENT
      this.$http.get(`api/attendee/${event.id}`).then(res => {
        this.selectedEvent = event
        this.eventInfoDialog = true
        this.loadingPage = false

        let clearDisciple = setInterval(() => {
          if (this.discipleList.length) {
            this.loadingPage = true
            clearInterval(clearDisciple)
            res.body.map(data => { this.$store.dispatch('addNewAttendee', data.disciple_id) })
          }
        }, 1000);
      })
    },
    insertDiscipleId(id){
      let find_index = this.attendees.findIndex(find => find == id)
      find_index == -1 ? this.attendees.push({ id : id }) : this.attendees.splice(find_index, 1)
    },
    newAttendee(){
      this.$store.dispatch('addNewAttendee', '')
    },
    updateEventAttendance(){
      this.formDisabled = true
      
      let data = { event_id: this.selectedEvent.id, attendees: this.attendees }
      this.$http.post('api/attendee', data).then(response => {
        this.$store.dispatch('clearAttendee')
        this.attendees = []

        response.body.map(data => {
          let find_index = this.attendeeList.findIndex(find => find.id == data.disciple_id)
          find_index == -1 ? this.$store.dispatch('addNewAttendee', data.disciple_id) : null
          if (data.status < 5){
            this.$store.dispatch('updateDiscipleStatus', { id: data.disciple_id, status: data.status, event_id: this.selectedEvent.id })
          }
        })

        this.formDisabled = false
        this.updateAttendanceDialog = false
        this.$store.commit('UPDATE_SNACKBAR', { snackbar: true, color: 'success', message: `Attendees for ${this.selectedEvent.name} is updated.` })
      })
    },
    checkTodayDisabled(){
      return this.selectedEvent.start ? this.getTimestamp() != this.selectedEvent.start.substring(0,10) ? true : false : false
    },
    onHideEventInfoDialog(){
      this.eventInfoDialog = false
      this.attendees = []
    }
  }
}
</script>