<template>
  <div>
    <add-disciple class="mb-5"></add-disciple>

    <v-data-table :headers="headers" :items="discipleList">

      <template v-slot:item.last_name="{ item }">
        <td>
          {{item.last_name}}, {{item.first_name}} {{item.middle_name}}
        </td>
      </template>

      <template v-slot:item.status="{ item }">
        <v-chip :color="statusList.find(find => find.id == item.status).color">
          {{statusList.find(find => find.id == item.status).text}}
        </v-chip>
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
    statusList: [
      { id: 0, text: '1T', color: 'error' },
      { id: 1, text: '2T', color: 'secondary' },
      { id: 2, text: '3T', color: 'success' },
      { id: 3, text: '4T', color: 'warning' },
      { id: 4, text: '5T', color: 'accent' },
      { id: 5, text: 'RD', color: 'primary' },
    ],

    headers: [
      { text: 'Name', value: 'last_name', sortable: false },
      // { text: 'Surname', value: 'last_name' },
      // { text: 'Given Name', value: 'first_name' },
      // { text: 'Middle Name', value: 'middle_name' },

      { text: 'Address', value: 'address' },

      { text: 'Network', value: 'network' },
      { text: 'Status', value: 'status' },
      { text: 'Cell Leader', value: 'cell_leader_id' },
      { text: 'Primary Leader', value: 'primary_leader_id' },
      { text: 'Actions', value: 'actions', sortable: false },
    ]
  }),
  computed: {
    discipleList(){
      return this.$store.state.discipleList;
    }
  },
  mounted(){
    this.$http.get('api/disciple').then(response => {
      this.$store.commit('GET_DISCIPLE_LIST', response.body)
    })
  }
}
</script>