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


      <v-dialog v-model="eventInfoDialog" max-width="1500">
        <v-card>
          <v-card-title :style="{ color: selectedEvent.color }">
            {{selectedEvent.name}}
            <v-spacer></v-spacer>
            
            <add-disciple :title_text="'Register 1T'" :event_id="selectedEvent.id" :checkTodayDisabled="checkTodayDisabled()"></add-disciple>
            <v-btn class="error" @click="onHideEventInfoDialog()">
              Close
            </v-btn>
          </v-card-title>
          <v-card-text>
            <v-layout wrap class="mt-5">
              <v-flex xs12>
                A: {{attendees}}
              </v-flex>
              <v-flex xs12>
                B: {{attendeeList}}
              </v-flex>
              <v-flex xs9>
                <v-layout wrap>
                  <v-flex xs12 class="mb-5">
                    <span class="overline ml-3">Attendees</span>
                    <v-divider style="margin: -1.7% 3% 0% 12%;"></v-divider>
                  </v-flex>
                  <v-flex xs12>
                    <v-btn small rounded class="primary mx-2" @click="newAttendee()"
                      :text="attendees.length != discipleList.length"
                      :disabled="attendeeList.length == discipleList.length">
                      Add Attendee
                    </v-btn>

                    <v-btn small rounded text class="success" @click="updateAttendanceDialog = true"
                      :disabled="!attendees.length ? true : false">
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

                      <template v-slot:item.address="{ item }">
                        <span class="text-truncate">
                          {{discipleList.find(find => find.id == item.id) ? discipleList.find(find => find.id == item.id).address : ''}}
                        </span>
                      </template>

                      <template v-slot:item.network="{ item }">
                        {{
                          discipleList.find(find => find.id == item.id) ?
                          networkList.find(find => find.id == discipleList.find(find => find.id == item.id).network).text : ''
                        }}
                      </template>

                      <template v-slot:item.inviter_id="{ item }">
                        <span class="text-truncate">
                          {{
                            item.id && discipleList.find(find => find.id == discipleList.find(find => find.id == item.id).inviter_id) ?
                            `${discipleList.find(find => find.id == discipleList.find(find => find.id == item.id).inviter_id).last_name}, ${discipleList.find(find => find.id == discipleList.find(find => find.id == item.id).inviter_id).first_name}` : ''
                          }}
                        </span>
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
              <v-flex xs3>
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
              <div class="mb-4">Processing please wait ...</div>
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
import { forEachOf } from 'async'
import createEvent from './actions/Add.vue'
import addDisciple from '../report/actions/Add.vue'
export default {
  components: {
    'create-event': createEvent,
    'add-disciple': addDisciple
  },
  data: () => ({
    selectedEvent: {},
    eventInfoDialog: false,
    weekday: [0, 1, 2, 3, 4, 5, 6],
    names: ['Sundary 1st Service', 'Sundary 2nd Service', 'Evening Prayer', 'Extreme Net'],

    
    attendees: [],
    headers: [
      { text: 'Status', value: 'status' },
      { text: 'Name', value: 'id', sortable: false },

      { text: 'Address', value: 'address' },
      { text: 'Network', value: 'network' },

      { text: 'Inviter', value: 'inviter_id' },
      { text: 'Cell Leader', value: 'cell_leader_id' },
      { text: 'Primary Leader', value: 'primary_leader_id' }
    ],

    updateAttendanceDialog: false
  }),
  computed: {
    discipleListFilter(){
      let unique_ids = [...new Set(this.attendees.concat(this.attendeeList).map(value => value.id))].filter(Number)
      return this.$store.state.discipleList.filter(find => unique_ids.findIndex(key => key == find.id) == -1)
    },
    attendeeList(){
      return this.$store.state.attendeeList;
    }
  },
  methods: {
    showEvent({ event }){
      this.$store.dispatch('clearAttendee')

      // GET ATTENDEES OF SELECTED EVENT
      this.$http.get(`api/attendee/${event.id}`).then(res => {
        this.selectedEvent = event
        this.eventInfoDialog = true

        res.body.map(data => { this.$store.dispatch('addNewAttendee', data.disciple_id) })
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
      // this.formDisabled = true
      
      forEachOf(this.attendees, (value, index, callback) => {
        // let find_disciple = this.discipleList.find(find => find.id == value.id)

        // if (find_disciple) {
        //   let data = { disciple_id: value.id, status: find_disciple.status < 5 ? find_disciple.status+1 : find_disciple.status, event_id: this.selectedEvent.id }


          this.$http.post('api/attendee', this.attendees).then(response => {
            console.log("attendess: ", response.body)
          })
        //   if (find_disciple.status < 5) {
        //     this.$http.put(`api/disciple/updateStatus/${value.id}`, find_disciple.status+1).then(res => {
        //       this.$store.dispatch("updateDisciple", res.body)
        //     })
        //   }
        // }

        callback()
      }, () => {
        // setTimeout(() => {
        //   this.$store.dispatch('clearAttendee')

        //   this.$http.get(`api/attendee/${this.selectedEvent.id}`).then(res => {
        //     res.body.map(data => { this.$store.dispatch('addNewAttendee', data.disciple_id) })

        //     this.formDisabled = false
        //     this.updateAttendanceDialog = false
        //   })
        // }, 1000)
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