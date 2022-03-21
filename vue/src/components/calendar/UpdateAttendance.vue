<template>
    <div>
        <v-layout wrap class="mt-5">
            <v-flex xs9>
                <v-layout wrap>
                    <v-flex xs12 class="mb-5">
                        <span class="overline ml-3">Attendees</span>
                        <v-divider style="margin: -1.7% 3% 0% 12%;"></v-divider>
                    </v-flex>
                    <v-flex xs12>
                        <add-attendee></add-attendee>
                    </v-flex>
                    <v-flex xs12 style="margin-right: 3%;">
                        <v-data-table :headers="headers" :items="attendeeList">

                            <template v-slot:item.id="{ item }">
                                <v-select v-if="!item.id"
                                    v-model="item.id"
                                    placeholder="Inviter"
                                    label="Inviter"
                                    dense hide-details
                                    class="my-2"

                                    :items="discipleList"
                                    item-value="id">
                                
                                    <template slot="selection" slot-scope="data">
                                        {{ data.item.last_name }}, {{ data.item.first_name }}
                                    </template>
                                    <template slot="item" slot-scope="data">
                                        {{ data.item.last_name }}, {{ data.item.first_name }}
                                    </template>
                                </v-select>

                                <span class="text-truncate" v-else>
                                    {{discipleList.find(find => find.id == item.id) ? `${discipleList.find(find => find.id == item.id).last_name}, ${discipleList.find(find => find.id == item.id).first_name}` : ''}}
                                </span>
                            </template>

                            <template v-slot:item.address="{ item }">
                                <span class="text-truncate">
                                    {{discipleList.find(find => find.id == item.id) ? discipleList.find(find => find.id == item.id).address : ''}}
                                </span>
                            </template>

                            <template v-slot:item.network="{ item }">
                                {{networkList.find(find => find.id == item.network).text}}
                            </template>

                            <template v-slot:item.status="{ item }">
                                <v-chip :color="statusList.find(find => find.id == item.status).color">
                                    {{statusList.find(find => find.id == item.status).text}}
                                </v-chip>
                            </template>

                            <template v-slot:item.inviter_id="{ item }">
                                <span class="text-truncate">
                                    {{
                                        discipleList.find(find => find.inviter_id == item.inviter_id) ?
                                        `${discipleList.find(find => find.inviter_id == item.inviter_id).last_name}, ${discipleList.find(find => find.inviter_id == item.inviter_id).first_name}` : ''
                                    }}
                                </span>
                            </template>

                            <template v-slot:item.cell_leader_id="{ item }">
                                <span class="text-truncate">
                                    {{
                                        discipleList.find(find => find.cell_leader_id == item.cell_leader_id) ?
                                        `${discipleList.find(find => find.cell_leader_id == item.cell_leader_id).last_name}, ${discipleList.find(find => find.cell_leader_id == item.cell_leader_id).first_name}` : ''
                                    }}
                                </span>
                            </template>
                            
                            <template v-slot:item.primary_leader_id="{ item }">
                                <span class="text-truncate">
                                    {{
                                        discipleList.find(find => find.primary_leader_id == item.primary_leader_id) ?
                                        `${discipleList.find(find => find.primary_leader_id == item.primary_leader_id).last_name}, ${discipleList.find(find => find.primary_leader_id == item.primary_leader_id).first_name}` : ''
                                    }}
                                </span>
                            </template>
                        </v-data-table>
                    </v-flex>
                </v-layout>
            </v-flex>
            <v-flex xs3>
                <v-layout wrap>
                    <v-flex xs12>
                        <span class="overline ml-3">Summary</span>
                        <v-divider style="margin: -5.5% 0% 0% 32%;"></v-divider>
                    </v-flex>
                </v-layout>
            </v-flex>
        </v-layout>
    </div>
</template>
<script>
import addAttendee from './actions/AddAttendee.vue'
export default {
    props: ['selectedEvent'],
    components: {
        'add-attendee': addAttendee
    },
    data:() => ({
        headers: [
            { text: 'Status', value: 'status' },
            { text: 'Name', value: 'id', sortable: false },

            { text: 'Address', value: 'address' },
            { text: 'Network', value: 'network' },

            { text: 'Inviter', value: 'inviter_id' },
            { text: 'Cell Leader', value: 'cell_leader_id' },
            { text: 'Primary Leader', value: 'primary_leader_id' }
        ],
    }),
    computed: {
        discipleList(){
            return this.$store.state.discipleList;
        },
        attendeeList(){
            return this.$store.state.attendeeList;
        }
    }
}
</script>