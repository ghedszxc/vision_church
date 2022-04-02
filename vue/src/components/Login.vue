<template>
    <div>
        <v-card class="centerDiv">
            <!-- <v-card-title>
                <v-spacer></v-spacer>
                LOGIN
                <v-spacer></v-spacer>
            </v-card-title> -->
            <v-card-text>
                <v-form ref="form_validation">
                    <v-layout wrap>
                        <v-flex xs12>
                            <v-text-field
                                v-model="username"
                                placeholder="Username"
                                prepend-inner-icon="mdi-account"
                                outlined
                            ></v-text-field>
                        </v-flex>
                        <v-flex xs12>
                            <v-text-field
                                v-model="password"
                                placeholder="Password"
                                prepend-inner-icon="mdi-lock"
                                :append-icon="show_passowrd ? 'mdi-eye' : 'mdi-eye-off'"
                                :type="show_passowrd ? 'text' : 'password'"
                                @click:append="show_passowrd = !show_passowrd"
                                outlined
                            ></v-text-field>
                        </v-flex>
                        <v-flex xs12>
                            <v-btn block class="primary py-6" @click="login()">
                                Login
                            </v-btn>
                        </v-flex>
                    </v-layout>
                </v-form>
            </v-card-text>
        </v-card>
    </div>
</template>
<script>
export default {
    data:() => ({
        username: '',
        password: '',
        show_passowrd: true
    }),
    methods:{
        login(){
            this.$http.post('api/auth/authLogin', { username: this.username, password: this.password }).then(res => {
                
                if (typeof res.body == 'object') {
                    // let today = new Date()
                    // today.setTime(today.getTime() + (7*24*60*60*1000))

                    // this.$auth.setToken(res.body[0].token, today.getTime());

                    // localStorage.setItem('token', res.body[0].token)
                    // sessionStorage.setItem('token', res.body[0].token)
                    // this.$router.push('/dashboard')
                    
                } else {
                    console.log("ELSE")
                    this.$store.commit('UPDATE_SNACKBAR', { snackbar: true, color: 'error', message: `${res.body}` })
                }
            })
        }
    }
}
</script>
<style scoped>
.centerDiv {
    margin: 15% auto auto auto;
    width: 25%;
}
</style>