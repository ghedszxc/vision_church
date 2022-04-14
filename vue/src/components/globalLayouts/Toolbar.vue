<template>
    <div>
        <v-app-bar app class="primary">
            <v-spacer></v-spacer>
            <v-btn icon :class="$route.path == '/dashboard' ? 'primary hidden-sm-and-down' : 'hidden-sm-and-down'" @click="$router.push('/dashboard')">
                <v-icon :color="$route.path == '/dashboard' ? 'white' : ''">mdi-view-dashboard</v-icon>
            </v-btn>

            <v-btn icon :class="$route.path == '/calendar' ? 'primary hidden-sm-and-down' : 'hidden-sm-and-down'" @click="$router.push('/calendar')">
                <v-icon :color="$route.path == '/calendar' ? 'white' : ''">mdi-calendar</v-icon>
            </v-btn>

            <v-btn icon :class="$route.path == '/disciple' ? 'primary hidden-sm-and-down' : 'hidden-sm-and-down'" @click="$router.push('/disciple')">
                <v-icon :color="$route.path == '/disciple' ? 'white' : ''">mdi-view-list</v-icon>
            </v-btn>

            <v-spacer></v-spacer>
            <v-menu offset-y open-on-hover bottom>
                <template v-slot:activator="{ on, attrs }">
                    <v-btn rounded text class="primary darken-1"
                        style="position: absolute; right: 10px;" v-bind="attrs" v-on="on">
                        <v-icon class="mr-2" size="20">mdi-account</v-icon>
                        {{authUser.name}}
                        <v-icon class="ml-2">mdi-menu-down</v-icon>
                    </v-btn>
                </template>
                <v-list>
                    <v-list-item @click="$router.push('/dashboard')" class="hidden-md-and-up">
                        <v-list-item-avatar>
                            <v-icon :color="$route.path == '/dashboard' ? 'primary' : ''">mdi-view-dashboard</v-icon>
                        </v-list-item-avatar>
                        <v-list-item-title>Dashboard</v-list-item-title>
                    </v-list-item>
                    <v-divider inset class="hidden-md-and-up mr-3"></v-divider>

                    <v-list-item @click="$router.push('/calendar')" class="hidden-md-and-up">
                        <v-list-item-avatar>
                            <v-icon :color="$route.path == '/calendar' ? 'primary' : ''">mdi-calendar</v-icon>
                        </v-list-item-avatar>
                        <v-list-item-title>Event</v-list-item-title>
                    </v-list-item>
                    <v-divider inset class="hidden-md-and-up mr-3"></v-divider>

                    <v-list-item @click="$router.push('/disciple')" class="hidden-md-and-up">
                        <v-list-item-avatar>
                            <v-icon :color="$route.path == '/disciple' ? 'primary' : ''">mdi-view-list</v-icon>
                        </v-list-item-avatar>
                        <v-list-item-title>Disciple</v-list-item-title>
                    </v-list-item>
                    <v-divider inset class="hidden-md-and-up mr-3"></v-divider>

                    <v-list-item @click="$router.push('/user')">
                        <v-list-item-avatar>
                            <v-icon :color="$route.path == '/user' ? 'primary' : ''">mdi-account-group</v-icon>
                        </v-list-item-avatar>
                        <v-list-item-title>User Management</v-list-item-title>
                    </v-list-item>
                    <v-divider inset class="hidden-md-and-up mr-3"></v-divider>

                    <v-list-item @click="logOutUser()">
                        <v-list-item-avatar>
                            <v-icon>mdi-exit-to-app</v-icon>
                        </v-list-item-avatar>
                        <v-list-item-title>Log out</v-list-item-title>
                    </v-list-item>
                </v-list>
            </v-menu>
        </v-app-bar>
    </div>
</template>
<script>
import Vue from 'vue'
export default {
    methods:{
        logOutUser(){
            Vue.auth.destoryToken()
            this.$store.commit('UPDATE_SNACKBAR', { snackbar: true, color: 'success', message: `Logging out.` })
            setTimeout(() => { this.$router.push('/') }, 1000);
        }
    }
}
</script>