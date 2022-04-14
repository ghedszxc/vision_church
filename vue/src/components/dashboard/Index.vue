<template>
    <div v-resize="onGlobalResize">
        <div class="text-h4 font-weight-bold">
            DASHBOARD
        </div>
        <v-layout wrap>
            <v-flex xs12 md3>
                <v-card class="mt-4">
                    <v-card-text>
                        <v-subheader class="title black--text text-truncate">This Week Attendees</v-subheader>
                        <div>
                            <apexchart type="pie" height="291" :options="weeklyReport" :series="weeklyReport.series"></apexchart>
                        </div>
                    </v-card-text>
                </v-card>
            </v-flex>
            <v-flex xs12 md3 class="px-3">
                <v-card class="mt-4">
                    <v-card-text>
                        <v-subheader class="title black--text text-truncate">This Month Attendees</v-subheader>
                        <div>
                            <apexchart type="pie" height="291" :options="monthlyReport" :series="monthlyReport.series"></apexchart>
                        </div>
                    </v-card-text>
                </v-card>
            </v-flex>
            <v-flex xs12 md4>
                <v-card class="mt-4" style="width: 99%;">
                    <v-card-text>
                        <v-subheader class="title black--text text-truncate">Birthday Celebrant This Week</v-subheader>
                        <v-list class="pr-4 my-2" :style="{ height: `${windowSize.height/5}px`, overflowY: 'auto', overflowX: 'hidden' }" v-if="birthdayCelebrants.length">
                            <template v-for="data in birthdayCelebrants">
                                <v-list-item :key="data.id">
                                    <v-list-item-avatar>
                                        <v-avatar class="white--text overline" size="40" :color="networkList.find(find => find.id == data.network).color">
                                            {{data.last_name.split('')[0]}}{{data.first_name.split('')[0]}}
                                        </v-avatar>
                                    </v-list-item-avatar>

                                    <v-list-item-content>
                                        <v-list-item-title>{{`${data.last_name}, ${data.first_name}`}}</v-list-item-title>
                                        <v-list-item-subtitle v-html="data.birthday"></v-list-item-subtitle>
                                    </v-list-item-content>

                                    <v-list-item-action v-if="checkBirthdayPassed(data.birthday)">
                                        <v-icon v-if="checkBirthdayPassed(data.birthday) == true" color="primary">mdi-check-bold</v-icon>
                                        <v-chip v-else class="success" small>
                                            Today's Birthday
                                        </v-chip>
                                    </v-list-item-action>
                                </v-list-item>
                                
                                <v-divider :key="`div-${data.id}`" inset></v-divider>
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
import moment from 'moment-timezone'
export default {
    data:() => ({
        birthdayCelebrants: [],

        weeklyReport:{
            legend: { position: 'bottom', markers: { height: 13, width: 13, radius: 2 } },
            dataLabels: { formatter: function (val, opts) { return opts.w.globals.seriesTotals[opts.seriesIndex] } },

            colors: [],
            series: [],
            labels: []
        },

        monthlyReport: {
            legend: { position: 'bottom', markers: { height: 13, width: 13, radius: 2 } },
            dataLabels: { formatter: function (val, opts) { return opts.w.globals.seriesTotals[opts.seriesIndex] } },

            colors: [],
            series: [],
            labels: []
        },
    }),
    mounted(){
        this.$http.post('api/disciple/getBirthdayCelebantThisWeek', this.getFirstAndLastDayThisWeek()).then(res => { this.birthdayCelebrants = res.body }) // BIRTHDAY CELEBRANT
        
         // WEEKLY REPORTING
        this.$http.get('api/attendee/weeklyReport/1').then(res => {
            res.body.map(value => {
                this.weeklyReport.labels.push(this.statusList.find(find => find.id == value.status).text)
                this.weeklyReport.colors.push(this.statusList.find(find => find.id == value.status).hex)
                this.weeklyReport.series.push(value.total)
            })
        })
        
         // MONTHLY REPORTING
        this.$http.get('api/attendee/monthlyReport/1').then(res => {
            res.body.map(value => {
                this.monthlyReport.labels.push(this.statusList.find(find => find.id == value.status).text)
                this.monthlyReport.colors.push(this.statusList.find(find => find.id == value.status).hex)
                this.monthlyReport.series.push(value.total)
            })
        })

    },
    methods:{
        getFirstAndLastDayThisWeek(){
            let dateNow = new Date
            let first = dateNow.getDate() - dateNow.getDay()
            let last = first + 6

            return {
                first: { day: new Date(dateNow.setDate(first)).getDate(), month: new Date(dateNow.setDate(first)).getMonth()+1 },
                last: { day: new Date(dateNow.setDate(last)).getDate(), month: new Date(dateNow.setDate(last)).getMonth()+1 } 
            }
        },
        checkBirthdayPassed(birthday){
            return birthday.substring(5) < moment().tz("Asia/Manila").format("MM-DD") ? true :
                   birthday.substring(5) == moment().tz("Asia/Manila").format("MM-DD") ? 'today' : false;
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