<template>
    <div style="display: inline-block;">
        <v-btn icon @click="inativeDiscipleDialog = true">
          <v-icon color="error">{{!selectedDisciple.is_archive ? 'mdi-archive' : 'mdi-package-up'}}</v-icon>
        </v-btn>
        
        <v-dialog v-model="inativeDiscipleDialog" persistent max-width="500">
            <v-card>
                <v-card-title v-if="!formDisabled">
                    <v-icon color="warning" class="mr-2">mdi-alert</v-icon>
                    Confirmation
                </v-card-title>
                <v-card-title v-else>
                    <v-progress-circular indeterminate color="primary" size="20" class="mr-2"></v-progress-circular>
                    Processing your request ...
                </v-card-title>
                <v-card-text class="mt-4">
                    Are you sure you want to set as inactive disciple {{selectedDisciple ? `${selectedDisciple.last_name}, ${selectedDisciple.first_name}` : ''}}?
                </v-card-text>
                <v-card-actions>
                    <v-spacer></v-spacer>
                    <v-btn class="success" @click="inactiveDisciple()" :disabled="formDisabled">
                        Yes
                    </v-btn>
                    <v-btn class="error" @click="inativeDiscipleDialog = false" :disabled="formDisabled">
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
            this.formDisabled = true
            this.$http.put(`api/disciple/updateIsArchive/${this.selectedDisciple.id}`, { is_archive: this.selectedDisciple.is_archive ? 0 : 1}).then(response => {
                this.$store.dispatch("updateDiscipleList", response.body)
                this.inativeDiscipleDialog = false
                this.formDisabled = false
            })
        }
    }
}
</script>