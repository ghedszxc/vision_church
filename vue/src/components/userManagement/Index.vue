<template>
    <div>
    <v-card flat>
      <v-card-title>
        <v-tabs v-model="showTab">
          <v-tab href="#1">User List</v-tab>
          <v-spacer class="hidden-sm-and-down"></v-spacer>
          <add-user class="mt-2 hidden-sm-and-down" :title_text="'Register User'"></add-user>
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
            <add-user :title_text="'Register User'"></add-user>
          </v-flex>
        </v-layout>
        <v-data-table :headers="headers" :items="userList">
          <template v-slot:item.actions="{ item }">
              {{item}}
            <!-- <edit-disciple :selectedDisciple="item"></edit-disciple>
            <delete-disciple :selectedDisciple="item"></delete-disciple> -->
          </template>
        </v-data-table>
      </v-card-text>
    </v-card>
    </div>
</template>
<script>
import addUser from './actions/Add.vue'
export default {
  components: {
    addUser
  },
  data:() => ({
    search: '',
    showTab: 1,

    headers: [
      { text: 'Name', value: 'name', sortable: false },
      { text: 'Username', value: 'username', sortable: false },
      { text: 'Actions', value: 'actions', sortable: false },
    ]
  }),
  computed:{
    userList(){
      return this.$store.state.users.userList.filter(value => {
        return value.name.toLowerCase().includes(this.search.toLowerCase())
      })
    }
  },
  mounted(){
    this.$http.get('api/auth').then(res => {
      console.log(res.body)
      this.$store.commit('users/GET_USER_LIST', res.body)
    })
  }
}
</script>