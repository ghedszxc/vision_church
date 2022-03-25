<template>
  <div>
    <v-tabs v-model="showTab">
      <v-tab href="#1">Active Disciples</v-tab>
      <v-tab href="#2">Inactive Disciples</v-tab>
      <v-spacer></v-spacer>
      <add-disciple class="mt-2" :title_text="'Register Disciple'"></add-disciple>
    </v-tabs>

    <v-text-field
      v-model="search"
      label="Search ..."

      outlined dense
      style="margin-top: 20px; width: 300px; position: fixed; left: 20px;"

      @click:append="search = ''"
    ></v-text-field>
    <v-data-table style="margin-top: 70px;" :headers="headers" :items="showTab == 1 ? discipleListReport : archivedDiscipleListReport">
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
        <edit-disciple :selectedDisciple="item"></edit-disciple>
        <delete-disciple :selectedDisciple="item"></delete-disciple>
      </template>
    </v-data-table>
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
      { text: 'Status', value: 'status' },
      { text: 'Name', value: 'full_name', sortable: false },

      { text: 'Address', value: 'address' },
      { text: 'Network', value: 'network' },

      { text: 'Cell Leader', value: 'cell_leader_id' },
      { text: 'Primary Leader', value: 'primary_leader_id' },
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
  }
}
</script>