<template>
  <div>
    <v-tabs v-model="showTab">
      <v-tab href="#1">Active Disciples</v-tab>
      <v-tab href="#2">Inactive Disciples</v-tab>
      <v-spacer></v-spacer>
      <add-disciple class="mt-2" :title_text="'Register Disciple'"></add-disciple>
    </v-tabs>

    <v-tabs-items v-model="showTab">
      <v-tab-item value="1" class="mt-5">
        <v-data-table :headers="headers" :items="discipleList">
          <template v-slot:item.last_name="{ item }">
            {{item.last_name}}, {{item.first_name}}
          </template>

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
      </v-tab-item>
      <v-tab-item value="2" class="mt-5">
        <v-data-table :headers="headers" :items="archivedDiscipleList">
          <template v-slot:item.last_name="{ item }">
            {{item.last_name}}, {{item.first_name}}
          </template>

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
      </v-tab-item>
    </v-tabs-items>
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
    showTab: 1,
    headers: [
      { text: 'Status', value: 'status' },
      { text: 'Name', value: 'last_name', sortable: false },

      { text: 'Address', value: 'address' },
      { text: 'Network', value: 'network' },

      { text: 'Cell Leader', value: 'cell_leader_id' },
      { text: 'Primary Leader', value: 'primary_leader_id' },
      { text: 'Actions', value: 'actions', sortable: false },
    ]
  }),
  computed: {
    discipleList(){
      return this.$store.state.discipleList;
    },
    archivedDiscipleList(){
      return this.$store.state.archivedDiscipleList;
    },
  },
  mounted(){
    this.$http.get('api/disciple').then(response => {
      this.$store.commit('GET_DISCIPLE_LIST', response.body)
    })
  }
}
</script>