<template>
    <div>
        <v-btn text :class="title_text == 'Register 1T' ? 'primary mr-2' : 'primary'" @click="addUserDialog = true"
            :disabled="checkTodayDisabled">
            <v-icon class="mr-2" size="20">mdi-plus</v-icon>
            {{title_text}}
        </v-btn>

        <v-dialog v-model="addUserDialog" persistent max-width="500">
            <v-card>
                <v-card-title>
                    <span v-if="!formDisabled">
                        {{title_text}}
                    </span>
                    <span v-else>
                        <v-progress-circular indeterminate color="primary" size="20" class="mr-2"></v-progress-circular>
                        Processing your request ...
                    </span>
                    <v-spacer></v-spacer>
                    <v-btn text color="error" @click="clearForm()" :disabled="formDisabled">
                        close
                    </v-btn>
                </v-card-title>
                <v-card-text class="mt-4">
                    <v-form ref="form">
                        <v-layout wrap>
                            <v-flex xs12 class="mb-7">
                                <span class="overline">Basic Information</span>
                                <v-divider style="margin: -3.5% 0% 0% 35%;"></v-divider>
                            </v-flex>
                            <v-flex xs12>
                                <v-text-field
                                    v-model="form.name"
                                    placeholder="Name"
                                    label="Name"
                                    outlined
                                    @input="setTypeCapitalize('last_name', form.last_name)"

                                    :disabled="formDisabled"
                                    :rules="[
                                        field_rules.required,
                                        field_rules.text_and_spaces_only
                                    ]"
                                ></v-text-field>
                            </v-flex>
                            <v-flex xs12>
                                <v-text-field
                                    v-model="form.username"
                                    placeholder="Username"
                                    label="Username"
                                    outlined

                                    :disabled="formDisabled"
                                    :rules="[
                                        field_rules.required,
                                        duplicateUsername
                                    ]"
                                ></v-text-field>
                            </v-flex>
                            <v-flex xs12>
                                <span class="overline">Password</span>
                                <v-divider style="margin: -3.5% 0% 0% 20%;"></v-divider>
                            </v-flex>
                            <v-flex xs12 class="mt-8">
                                <v-text-field
                                    v-model="form.password"
                                    label="Password"
                                    :disabled="formDisabled"
                                    :append-icon="show1 ? 'mdi-eye' : 'mdi-eye-off'"
                                    @click:append="show1 = !show1"
                                    :type="show1 ? 'text' : 'password'"

                                    outlined 

                                    :rules="[field_rules.required]"
                                ></v-text-field>
                            </v-flex>
                            <v-flex xs12>
                                <v-text-field
                                    v-model="form.confirm_password"
                                    label="Confirm Password"
                                    :disabled="formDisabled"
                                    :append-icon="show2 ? 'mdi-eye' : 'mdi-eye-off'"
                                    @click:append="show2 = !show2"
                                    :type="show2 ? 'text' : 'password'"

                                    outlined 
                                    :rules="[field_rules.required, (value) => (value === form.password) || 'Password confirmation does not match']"
                                ></v-text-field>
                            </v-flex>
                        </v-layout>
                    </v-form>
                </v-card-text>
                <v-card-actions>
                    <v-spacer></v-spacer>
                    <v-btn class="success px-5 mr-2" @click="addUser()" :disabled="formDisabled">
                        Submit
                    </v-btn>
                </v-card-actions>
            </v-card>
        </v-dialog>
    </div>
</template>
<script>
export default {
    props: ['title_text', 'event_id', 'checkTodayDisabled'],
    data:() => ({
        addUserDialog: false,

        show1: false,
        show2: false,

        form: {
            name: '', username: '', password: '', confirm_password: ''
        }
    }),
    methods:{
        setTypeCapitalize(object_name, data){
            if (object_name && data){
                let separateWord = data.toLowerCase().split(' ')

                for (let i = 0; i < separateWord.length; i++) {
                    separateWord[i] = separateWord[i].charAt(0).toUpperCase() + separateWord[i].substring(1)
                }

                this.form[object_name] =separateWord.join(' ')
            }
        },
        duplicateUsername(value) {
            return this.$store.state.users.userList.findIndex(find => find.username.toLowerCase() == value.toString().toLowerCase()) != -1 ? `Username already exists.` : true
        },

        clearForm(){
            this.$refs.form.reset()
            this.addUserDialog = false

            this.form = {
                name: '', username: '', password: '', confirm_password: ''
            }
        },
        addUser(){
            if (this.$refs.form.validate()) {
                this.formDisabled = true
                this.$http.post('api/auth', this.form).then(res => {
                    if (res.body.status) {
                        this.$store.commit('UPDATE_SNACKBAR', { snackbar: true, color: 'error', timeout: 3000, message: res.body.message })
                    } else {
                        this.clearForm()
                        this.$store.commit('users/ADD_NEW_USER', res.body)
                        this.$store.commit('UPDATE_SNACKBAR', { snackbar: true, color: 'success', timeout: 3000, message: `${res.body.name} is added from user list` })
                    }
                })
            }
        }
    }
}
</script>