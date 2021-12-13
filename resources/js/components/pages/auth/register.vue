<template>
    <div class="container mt-4">
        <div class="row justify-content-center">
            <div class="col-6">
                <div class="card">
                    <div class="card-header text-center">
                        <h3>Register</h3>
                    </div>
                    <div class="card-body">
                        <form>
                            <div class="form-group">
                                <label for="name">Name</label>
                                <input type="text" id="name" v-model="form.name" name="name" class="form-control">
                                <div class="text-danger" v-if="form.errors.has('name')" v-html="form.errors.get('name')" />
                            </div>
                            <div class="form-group">
                                <label for="email">Email</label>
                                <input type="text" id="email" v-model="form.email" name="email" class="form-control">
                                <div class="text-danger" v-if="form.errors.has('email')" v-html="form.errors.get('email')" />
                            </div>
                            <div class="form-group">
                                <label for="password">Password</label>
                                <input type="password" id="password" v-model="form.password" name="password" class="form-control">
                                <div class="text-danger" v-if="form.errors.has('password')" v-html="form.errors.get('password')" />
                            </div>
                            <div class="form-group">
                                <label for="password_confirmation">Confirmed Password</label>
                                <input type="password" id="password_confirmation" v-model="form.password_confirmation" name="password_confirmation" class="form-control">
                                <div class="text-danger" v-if="form.errors.has('password_confirmation')" v-html="form.errors.get('password_confirmation')" />
                            </div>
                            <div class="form-group">
                                <p>Aready have an account?
                                    <router-link :to="{name: 'login'}">Click here to Login</router-link>
                                </p>
                            </div>
                            <div class="form-group">
                                <input type="submit" @click.prevent="register" class="btn btn-success px-3" value="Register">
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
        async register(){
            await axios.get('/sanctum/csrf-cookie').then(response => {
                //Register route
             this.form.post('/register').then((response)=>{
                    this.form.name = ''
                    this.form.email = ''
                    this.form.password = ''
                    this.form.password_confirmation = ''

                    this.$toast.success({
                        title:'Success',
                        message:'Account created successfully'
                    })
                    this.$router.push({name: 'login'})
                })
            })

        }
    }
}
</script>

<style scoped>

</style>
