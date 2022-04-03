<template>
  <div>
    <v-card flat>
      <v-card-title>
        <v-tabs v-model="showTab">
          <v-tab href="#1">Active Disciples</v-tab>
          <v-tab href="#2">Inactive Disciples</v-tab>
          <v-spacer class="hidden-sm-and-down"></v-spacer>
          <add-disciple class="mt-2 hidden-sm-and-down" :title_text="'Register Disciple'"></add-disciple>
        </v-tabs>
      </v-card-title>

      <v-card-text>
        <v-layout wrap>
          <v-flex xs12 md9>
            <v-text-field
              v-model="search"
              label="Search ..."

              outlined dense
              :full-width="false" style="display: inline-block; width: 300px;"

              @click:append="search = ''"
            ></v-text-field>
          </v-flex>
          <v-flex xs12 md3 class="hidden-md-and-up">
            <add-disciple :title_text="'Register Disciple'"></add-disciple>
          </v-flex>
        </v-layout>
        <v-data-table :headers="headers" :items="showTab == 1 ? discipleListReport : archivedDiscipleListReport" v-if="!tableLoad">
          <template v-slot:item.network="{ item }">
            {{networkList.find(find => find.id == item.network).text}}
          </template>

          <template v-slot:item.status="{ item }">
            <v-chip :color="statusList.find(find => find.id == item.status).color">
              {{statusList.find(find => find.id == item.status).text}}
            </v-chip>
          </template>

          <template v-slot:item.cell_leader_id="{ item }">
            {{
              discipleList.find(find => find.id == item.cell_leader_id) ?
              `${discipleList.find(find => find.id == item.cell_leader_id).last_name}, ${discipleList.find(find => find.id == item.cell_leader_id).first_name}` : ''
            }}
          </template>
          
          <template v-slot:item.primary_leader_id="{ item }">
            {{
              discipleList.find(find => find.id == item.primary_leader_id) ?
              `${discipleList.find(find => find.id == item.primary_leader_id).last_name}, ${discipleList.find(find => find.id == item.primary_leader_id).first_name}` : ''
            }}
          </template>

          <template v-slot:item.actions="{ item }">
            <edit-disciple :selectedDisciple="item" v-if="showTab == 1"></edit-disciple>
            <delete-disciple :selectedDisciple="item"></delete-disciple>
          </template>
        </v-data-table>
      </v-card-text>
    </v-card>
  </div>
</template>
<script>
import addDisciple from './actions/Add.vue'
import editDisciple from './actions/Edit.vue'
import deleteDisciple from './actions/Delete.vue'
export default {
  components: {
    'add-disciple': addDisciple,
    'edit-disciple': editDisciple,
    'delete-disciple': deleteDisciple
  },
  data: () => ({
    search: '',
    showTab: 1,
    headers: [
      { text: 'Status', value: 'status', sortable: false },
      { text: 'Name', value: 'full_name', sortable: false },

      { text: 'Address', value: 'address', sortable: false },
      { text: 'Network', value: 'network', sortable: false },

      { text: 'Cell Leader', value: 'cell_leader_id', sortable: false },
      { text: 'Primary Leader', value: 'primary_leader_id', sortable: false },
      { text: 'Actions', value: 'actions', sortable: false },
    ]
  }),
  computed:{
    discipleListReport(){
      return this.$store.state.discipleList.filter(value => {
        return value.full_name.toLowerCase().includes(this.search.toLowerCase())
      })
    },
    archivedDiscipleListReport(){
      return this.$store.state.archivedDiscipleList.filter(value => {
        return value.full_name.toLowerCase().includes(this.search.toLowerCase())
      })
    }
  },
  mounted(){
    this.$http.get('api/disciple').then(res => { this.$store.commit('GET_DISCIPLE_LIST', res.body) }) // GET ALL DISCIPLES
    this.$http.get('api/disciple/getInactiveDisiples/1').then(res => { this.$store.commit('GET_INACTIVE_DISCIPLE_LIST', res.body) }) // GET ALL INACTIVE DISCIPLES
  }
}
</script>