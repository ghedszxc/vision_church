<template>
    <div style="display: inline-block;">
        <v-btn rounded text class="primary" @click="addDiscipleDialog = true">
            <v-icon class="mr-2" size="20">mdi-plus</v-icon>
            Register Disciple
        </v-btn>

        <v-dialog v-model="addDiscipleDialog" persistent max-width="1000">
            <v-card>
                <v-card-title>
                    Register Disciple
                    <v-spacer></v-spacer>
                    <v-btn text color="success" @click="addDisciple()">
                        Add
                    </v-btn>
                    <v-btn text color="error" @click="addDiscipleDialog = false">
                        close
                    </v-btn>
                </v-card-title>
                <v-card-text class="mt-4">
                    <v-form ref="form">
                        <v-layout wrap>
                            <v-flex xs12 class="mb-5">
                                <span class="overline">Basic Information</span>
                                <v-divider style="margin: -1.7% 0% 0% 17%;"></v-divider>
                            </v-flex>
                            <v-flex xs12 md3>
                                <v-text-field
                                    v-model="form.last_name"
                                    placeholder="Surname"
                                    outlined
                                ></v-text-field>
                            </v-flex>
                            <v-flex xs12 md4 class="px-2">
                                <v-text-field
                                    v-model="form.first_name"
                                    placeholder="Given Name"
                                    outlined
                                ></v-text-field>
                            </v-flex>
                            <v-flex xs12 md3 class="pr-2">
                                <v-text-field
                                    v-model="form.middle_name"
                                    placeholder="Middle Name"
                                    outlined
                                ></v-text-field>
                            </v-flex>
                            <v-flex xs12 md2>
                                <v-text-field
                                    v-model="form.suffix"
                                    placeholder="Suffix"
                                    outlined
                                ></v-text-field>
                            </v-flex>
                            
                            <v-flex xs12 md3>
                                <v-menu
                                    v-model="menu"
                                    :close-on-content-click="false"
                                    :nudge-right="40"
                                    transition="scale-transition"
                                    offset-y
                                    min-width="auto">
                                    <template v-slot:activator="{ on, attrs }">
                                        <v-text-field
                                            v-model="form.birthday"
                                            placeholder="Birthday"
                                            outlined
                                            v-bind="attrs"
                                            v-on="on"
                                        ></v-text-field>
                                    </template>
                                    <v-date-picker v-model="form.birthday" @input="menu = false"></v-date-picker>
                                </v-menu>
                            </v-flex>
                            <v-flex xs12 md9 class="pl-2">
                                <v-text-field
                                    v-model="form.address"
                                    placeholder="Address"
                                    outlined
                                ></v-text-field>
                            </v-flex>
                            
                            <v-flex xs12 class="mb-5">
                                <span class="overline">Church Status</span>
                                <v-divider style="margin: -1.7% 0% 0% 17%;"></v-divider>
                            </v-flex>
                            <v-flex xs12 md3>
                                <v-select
                                    v-model="form.status"
                                    placeholder="Status"
                                    outlined

                                    :items="statusList"
                                    item-text="text"
                                    item-value="id"
                                ></v-select>
                            </v-flex>
                            <v-flex xs12 md3 class="px-2">
                                <v-select
                                    v-model="form.network"
                                    placeholder="Network"
                                    outlined

                                    :items="networkList"
                                    item-text="text"
                                    item-value="id"
                                ></v-select>
                            </v-flex>
                            <v-flex xs12 md3 class="pr-2">
                                <v-select
                                    v-model="form.cell_leader_id"
                                    placeholder="Network"
                                    outlined

                                    :items="discipleList"
                                    item-text="last_name"
                                    item-value="id"
                                ></v-select>
                            </v-flex>
                            <v-flex xs12 md3>
                                <v-select
                                    v-model="form.primary_leader_id"
                                    placeholder="Network"
                                    outlined

                                    :items="discipleList"
                                    item-text="last_name"
                                    item-value="id"
                                ></v-select>
                            </v-flex>
                        </v-layout>
                    </v-form>
                </v-card-text>
            </v-card>
        </v-dialog>

    </div>
</template>
<script>
export default {
    data:() => ({
        statusList: [
            { id: 0, text: '1T', color: 'error' },
            { id: 1, text: '2T', color: 'secondary' },
            { id: 2, text: '3T', color: 'success' },
            { id: 3, text: '4T', color: 'warning' },
            { id: 4, text: '5T', color: 'accent' },
            { id: 5, text: 'RD', color: 'primary' },
        ],

        networkList: [
            { id: 0, text: 'YM' },
            { id: 1, text: 'M' },
            { id: 2, text: 'YW' },
            { id: 3, text: 'W' }
        ],

        positionList: [
            'VIP', 'Disciple', 'Leader', 'Primary'
        ],
        

        addDiscipleDialog: false,
        menu: false,

        form: {
            last_name: '', first_name: '', middle_name: '', suffix: '',
            status: 0, network: 0,

            address: '', birthday: '', age: 0, position: 0,

            cell_leader_id: 0, primary_leader_id: 0
        }
    }),
    computed: {
        discipleList(){
            return this.$store.state.discipleList;
        }
    },
    methods:{
        addDisciple(){
            this.$http.post('api/disciple', this.form).then(response => {
                console.log("??", response.body)
            })
        }
    }
}
</script>