<template>
    <div v-resize="onGlobalResize">
        <div class="text-h4 font-weight-bold">
            DASHBOARD
        </div>
        <v-layout wrap>
            <v-flex xs12 md9>
                <v-card class="mt-4" style="width: 99%;">
                    <v-card-text>
                        <v-subheader class="title black--text text-truncate">Monthly Reports</v-subheader>
                        <div>
                            {{monthlyReport}}
                        </div>
                    </v-card-text>
                </v-card>
            </v-flex>
            <v-flex xs12 md3>
                <v-card class="mt-4" style="width: 99%;">
                    <v-card-text>
                        <v-subheader class="title black--text text-truncate">Birthday Celebrant This Week</v-subheader>
                        <v-list class="pr-4 my-2" :style="{ height: `${windowSize.height/5}px`, overflowY: 'auto', overflowX: 'hidden' }" v-if="birthdayCelebrants.length">
                            <template v-for="data in birthdayCelebrants">
                                <!-- <v-divider :key="`div-${data.full_name}`" inset></v-divider> -->
                                <v-list-item :key="data.full_name">
                                    <v-list-item-avatar>
                                        <v-avatar class="white--text overline" size="40" :color="networkList.find(find => find.id == data.network).color">
                                            {{data.last_name.split('')[0]}}{{data.first_name.split('')[0]}}
                                        </v-avatar>
                                    </v-list-item-avatar>

                                    <v-list-item-content>
                                        <v-list-item-title v-html="data.full_name"></v-list-item-title>
                                        <v-list-item-subtitle v-html="data.birthday"></v-list-item-subtitle>
                                    </v-list-item-content>
                                </v-list-item>
                                
                                <v-divider :key="`div-${data.full_name}`" inset></v-divider>
                            </template>
                        </v-list>
                        <div v-else class="overline text-center py-2">
                            <v-divider></v-divider>
                            <div class="mt-4">
                                No birthday celebrant this week
                            </div>
                        </div>
                    </v-card-text>
                    <v-divider v-if="birthdayCelebrants.length"></v-divider>
                    <v-card-actions class="overline ml-2" v-if="birthdayCelebrants.length">
                        Total Celebrants: <v-chip class="ml-2" color="primary">{{birthdayCelebrants.length}}</v-chip>
                    </v-card-actions>
                </v-card>
            </v-flex>
        </v-layout>
    </div>
</template>
<script>
export default {
    data:() => ({
        birthdayCelebrants: [],
        monthlyReport: []
    }),
    mounted(){
        this.$http.get('api/disciple/getBirthdayCelebantThisWeek/1').then(res => { this.birthdayCelebrants = res.body }) // BIRTHDAY CELEBRANT
            this.$http.get('api/attendee/monthlyReport/1').then(res => { this.monthlyReport = res.body }) // MONTHLY REPORTING

    },
    methods:{
        addUser(){
            // this.$http.post('api/auth', { name: 'z', username: 'z', password: 'z'}).then(response => {
            //     console.log("?", response.body)
            // })
        }
    }
}
</script>
<style scoped>
::-webkit-scrollbar {
    height:0;
    width:5px;
    border-radius: 4px;
    background: transparent;
    transition: all 0.3s ease;
}

::-webkit-scrollbar:hover {
    background: transparent;
}

::-webkit-scrollbar-thumb {
    background:#BDBDBD;
    border-radius: 4px;
}
</style>