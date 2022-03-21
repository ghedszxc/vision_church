<template>
    <div style="display: inline-block;">
        <v-btn icon @click="inativeDiscipleDialog = true">
          <v-icon color="error">{{!selectedDisciple.is_archive ? 'mdi-archive' : 'mdi-package-up'}}</v-icon>
        </v-btn>
        
        <v-dialog v-model="inativeDiscipleDialog" persistent max-width="500">
            <v-card>
                <v-card-title>
                    <v-icon color="warning" class="mr-2">mdi-alert</v-icon>
                    Confirmation
                </v-card-title>
                <v-card-text class="mt-4">
                    Are you sure you want to set as inactive disciple {{selectedDisciple ? `${selectedDisciple.last_name}, ${selectedDisciple.first_name}` : ''}}?
                </v-card-text>
                <v-card-actions>
                    <v-spacer></v-spacer>
                    <v-btn class="success" @click="inactiveDisciple()">
                        Yes
                    </v-btn>
                    <v-btn class="error" @click="inativeDiscipleDialog = false">
                        No
                    </v-btn>
                </v-card-actions>
            </v-card>
        </v-dialog>
    </div>
</template>
<script>
export default {
    props: ['selectedDisciple'],
    data:() => ({
        inativeDiscipleDialog: false,
    }),
    methods:{
        inactiveDisciple(){
            this.$http.delete(`api/disciple/${this.selectedDisciple.id}`).then(response => {
                this.$store.dispatch("updateDiscipleList", response.body)
                this.inativeDiscipleDialog = false
            })
        }
    }
}
</script>