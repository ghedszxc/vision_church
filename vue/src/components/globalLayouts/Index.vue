<template>
    <v-app>
        <v-main>
            <tool-bar></tool-bar>
            <v-snackbar top
                v-model="snackBar.snackbar"
                :timeout="snackBar.timeout"
                :color="snackBar.color">
                {{ snackBar.message }}
            </v-snackbar>
            <router-view class="pa-5"></router-view>
        </v-main>
    </v-app>
</template>
<script>
import toolbar from './Toolbar.vue'
export default {
    components: {
        'tool-bar': toolbar
    },
    mounted(){
        this.$http.get('api/event').then(res => { this.$store.commit('GET_EVENT_LIST', res.body) }) // GET ALL EVENTS
        this.$http.get('api/disciple').then(res => { this.$store.commit('GET_DISCIPLE_LIST', res.body) }) // GET ALL DISCIPLES
        this.$http.get('api/disciple/getInactiveDisiples/1').then(res => { this.$store.commit('GET_INACTIVE_DISCIPLE_LIST', res.body) }) // GET ALL INACTIVE DISCIPLES
    }
}
</script>