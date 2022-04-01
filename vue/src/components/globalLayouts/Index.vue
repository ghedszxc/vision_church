<template>
    <v-app>
        <v-main>
            <tool-bar></tool-bar>
            <v-snackbar top
                v-model="snackBar.snackbar"
                :timeout="snackBar.timeout"
                :color="snackBar.color">
                {{ snackBar.message }}

                <template v-slot:action="{ attrs }">
                    <v-btn small icon v-bind="attrs" @click="hideSnackBar()">
                        <v-icon small color="white">mdi-close</v-icon>
                    </v-btn>
                </template>
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
    methods:{
        hideSnackBar(){
            this.$store.commit('UPDATE_SNACKBAR', { snackbar: false, color: '', timeout: -1, message: '' })
        }
    }
}
</script>