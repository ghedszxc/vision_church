<template>
    <div v-resize="onGlobalResize">
        <div class="text-h4 font-weight-bold">
            DASHBOARD
        </div>
        <v-layout wrap>
            <v-flex xs12 md4>
                <v-card class="mt-4">
                    <v-card-text>
                        <v-subheader class="title black--text">Birthday Celebrant This Week</v-subheader>
                        <v-list class="pr-4 my-2" :style="{ height: `${windowSize.height/5}px`, overflowY: 'auto', overflowX: 'hidden' }">
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
                    </v-card-text>
                    <v-divider></v-divider>
                    <v-card-actions class="overline ml-2">
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
    }),
    mounted(){
        this.$http.get('api/disciple/getBirthdayCelebantThisWeek/1').then(response => {
            this.birthdayCelebrants = response.body
        })
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