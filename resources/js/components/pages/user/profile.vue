<template>
    <div class="container mt-4">
        <div class="row justify-content-center">
            <div class="col-3">
                <div class="list-group">
                    <router-link :to="{name: 'dashboard'}" active-class="active" exact class="list-group-item list-group-item-action ">Dashboard</router-link>
                    <router-link :to="{name: 'profile'}" active-class="active" exact class="list-group-item list-group-item-action">User Profile</router-link>
                </div>
            </div>
            <div class="col-9">
                <div class="card">
                    <div class="card-header text-center">
                        <h3>User Profile</h3>
                    </div>
                    <div class="card-body">
                        <form>
                            <div class="row">
                                <div class="col-6">
                                    <div class="form-group">
                                        <label for="name">Name</label>
                                        <input type="text" id="name" v-model="form.name" name="name" class="form-control">
                                        <div class="text-danger" v-if="form.errors.has('name')" v-html="form.errors.get('name')" />
                                    </div>
                                </div>
                                <div class="col-6">
                                    <div class="form-group">
                                        <label for="email">Email</label>
                                        <input type="text" id="email" v-model="form.email" name="email" class="form-control">
                                        <div class="text-danger" v-if="form.errors.has('email')" v-html="form.errors.get('email')" />
                                    </div>
                                </div>
                                <div class="col-6">
                                    <div class="form-group">
                                        <label for="password">Password</label>
                                        <input type="password" id="password" v-model="form.password" name="password" class="form-control">
                                        <div class="text-danger" v-if="form.errors.has('password')" v-html="form.errors.get('password')" />
                                    </div>
                                </div>
                                <div class="col-6">
                                    <div class="form-group">
                                        <label for="password_confirmation">Confirmed Password</label>
                                        <input type="password" id="password_confirmation" v-model="form.password_confirmation" name="password_confirmation" class="form-control">
                                        <div class="text-danger" v-if="form.errors.has('password_confirmation')" v-html="form.errors.get('password_confirmation')" />
                                    </div>
                                </div>
                                <div class="col-6">
                                    <div class="form-group">
                                        <input type="submit" @click.prevent="updateProfile" class="btn btn-success px-3" value="Save Profile">
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import Form from "vform";

export default {
    data(){
        return{
            form: new Form({
                name: '',
                email: '',
                password: '',
                password_confirmation: ''
            })
        }
    },
    methods: {
         updateProfile(){
             axios.get('/sanctum/csrf-cookie').then(response => {
                //Profile update route
                this.form.put('/api/user').then((response)=>{
                    //Clear password  and confirm password field after user update
                    this.form.password = ''
                    this.form.password_confirmation = ''

                    //update vuex store after user update
                    let user = response.data;
                    this.$store.commit('SET_USER', user);

                    //Toast notification show after user update
                    this.$toast.success({
                        title:'Success',
                        message:'Profile updated successfully'
                    })

                })
            })

        },
    },

    computed: {
        user(){
            let user = this.$store.getters.getUser
            this.form.name = user.name
            this.form.email = user.email
            this.form.password = user.password
        }
    },
    mounted() {
        this.user
    }
}
</script>

<style scoped>

</style>
