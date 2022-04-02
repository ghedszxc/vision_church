<template>
    <div v-resize="onGlobalResize">
        <v-card :style="{ margin: '15% auto auto auto', width: `${windowSize.height/2}px`}">
            <v-card-text>
                <v-form ref="form_validation">
                    <v-layout wrap>
                        <v-flex xs12>
                            <v-text-field
                                v-model="username"
                                placeholder="Username"
                                prepend-inner-icon="mdi-account"
                                outlined :disabled="formDisabled"
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
                                outlined :disabled="formDisabled"
                            ></v-text-field>
                        </v-flex>
                        <v-flex xs12>
                            <v-btn block class="primary py-6" @click="login()" :disabled="formDisabled">
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
            this.formDisabled = true
            this.$http.post('api/auth/authLogin', { username: this.username, password: this.password }).then(res => {
                if (typeof res.body == 'object') {
                    let today = new Date()
                    today.setTime(today.getTime() + (7*24*60*60*1000))
                    this.$auth.setToken(res.body, today.getTime());

                    this.$router.push('/')
                    this.$store.commit('UPDATE_SNACKBAR', { snackbar: true, color: 'success', message: `Login success` })
                    
                } else {
                    this.$store.commit('UPDATE_SNACKBAR', { snackbar: true, color: 'error', message: `${res.body}` })
                    this.formDisabled = false
                }
            })
        }
    }
}
</script>