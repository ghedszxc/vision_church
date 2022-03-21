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
    }
}
</script>