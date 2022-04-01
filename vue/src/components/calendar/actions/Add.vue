<template>
    <div style="display: inline-block;">
        <v-btn text class="primary" @click="createEventDialog = true">
            <v-icon class="mr-2" size="20">mdi-plus</v-icon>
            Create Event
        </v-btn>

        <v-dialog v-model="createEventDialog" persistent max-width="1000">
            <v-card>
                <v-card-title>
                    Create Event
                    <v-spacer></v-spacer>
                    <v-btn text color="error" @click="hideDialog()" :disabled="formDisabled">
                        close
                    </v-btn>
                </v-card-title>
                <v-card-text class="mt-4">
                    <v-form ref="form">
                        <v-layout wrap>
                            <v-flex xs12 class="mb-7">
                                <span class="overline">Basic Information</span>
                                <v-divider style="margin: -1.7% 0% 0% 17%;"></v-divider>
                            </v-flex>
                            <v-flex xs12 md4>
                                <v-select
                                    v-model="form.name"
                                    label="Event Name"
                                    placeholder="Event Name"

                                    :items="events"
                                    outlined

                                    :disabled="formDisabled"
                                    :rules="[field_rules.required]"
                                ></v-select>
                            </v-flex>
                            <v-flex xs12 md4 class="px-2">
                                <v-menu
                                    v-model="menu_01"
                                    :close-on-content-click="false"
                                    :nudge-right="40"
                                    transition="scale-transition"
                                    offset-y
                                    min-width="auto">
                                    <template v-slot:activator="{ on, attrs }">
                                        <v-text-field
                                            v-model="form.start"
                                            placeholder="Starts At"
                                            label="Starts At"
                                            outlined

                                            :disabled="formDisabled"
                                            :rules="[field_rules.required]"

                                            v-bind="attrs"
                                            v-on="on"
                                        ></v-text-field>
                                    </template>
                                    <v-time-picker landscape v-model="form.start"></v-time-picker>
                                </v-menu>
                            </v-flex>
                            <v-flex xs12 md4>
                                <v-menu
                                    v-model="menu_02"
                                    :close-on-content-click="false"
                                    :nudge-right="40"
                                    transition="scale-transition"
                                    offset-y
                                    min-width="auto">
                                    <template v-slot:activator="{ on, attrs }">
                                        <v-text-field
                                            v-model="form.end"
                                            placeholder="Ends At"
                                            label="Ends At"
                                            outlined
                                            
                                            :disabled="formDisabled"
                                            :rules="[field_rules.required]"

                                            v-bind="attrs"
                                            v-on="on"
                                        ></v-text-field>
                                    </template>
                                    <v-time-picker landscape v-model="form.end"></v-time-picker>
                                </v-menu>
                            </v-flex>
                        </v-layout>
                    </v-form>
                </v-card-text>
                <v-card-actions>
                    <v-spacer></v-spacer>
                    <v-btn class="success px-5 mr-2" @click="addEvent()" :disabled="formDisabled">
                        Submit
                    </v-btn>
                </v-card-actions>
            </v-card>
        </v-dialog>
    </div>
</template>
<script>
export default {
    data:() => ({
        events: [
            '1st Service',
            '2nd Service',
            'Evening Prayer',
            'Extreme Net',
            'Adult Net'
        ],
        createEventDialog: false,
        menu_01: false,
        menu_02: false,

        form: {
            name: '',
            start: '',
            end: ''
        }
    }),
    methods:{
        hideDialog(){
            this.createEventDialog = false
            this.formDisabled = false
            this.$refs.form.reset()
            this.form = {
                name: '',
                start: '',
                end: ''
            }
        },
        addEvent(){
            let date = new Date();
            let mm = (date.getMonth() + 1).toString().padStart(2, 0);
            let year = date.getFullYear();
            let dd = date.getDate().toString().padStart(2, 0);

            let data = {
                name: this.form.name,
                start: `${year}-${mm}-${dd} ${this.form.start}`,
                end: `${year}-${mm}-${dd} ${this.form.end}`,
                color: `#${Math.floor(Math.random()*16777215).toString(16)}`
            }
            
            this.formDisabled = true
            if (this.$refs.form.validate()) {
                this.$http.post('api/event', data).then(response => {
                    this.$store.dispatch('addNewEvent', response.body)
                    this.hideDialog()
                })
            }
        }
    }
}
</script>