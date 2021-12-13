<template>
    <div class="container mt-4">
        <div class="row justify-content-center">
            <div class="col-6">
                <div class="card">
                    <div class="card-header text-center">
                        <h3>Login</h3>
                    </div>
                    <div class="card-body">
                        <form @submit.prevent="login">
                            <div class="form-group">
                                <label for="email">Email</label>
                                <input type="text" id="email" name="email" v-model="form.email" class="form-control">
                                <div class="text-danger" v-if="form.errors.has('email')" v-html="form.errors.get('email')" />
                            </div>
                            <div class="form-group">
                                <label for="password">Password</label>
                                <input type="password" id="password" name="password" v-model="form.password" class="form-control">
                                <div class="text-danger" v-if="form.errors.has('password')" v-html="form.errors.get('password')" />
                            </div>
                            <div class="form-group">
                                <p>Don't have an account?
                                    <router-link :to="{name: 'register'}">Click here to Register</router-link>
                                </p>
                            </div>
                            <div class="form-group">
                                <input type="submit" class="btn btn-success px-3" value="Login">
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
                email: '',
                password: '',
            })
        }
    },

    methods: {
         async login(){
            await axios.get('/sanctum/csrf-cookie')//.then((res)=>{}) is not working
                //Login route
             await this.form.post('/login')//.then((res)=>{}) is not working
             //Get user data
             await  this.getUserData();

                    this.$toast.success({
                        title:'Success',
                        message:'Login successfully'
                    })
                    this.$router.push({name: 'dashboard'})


        },
        async getUserData(){
            await axios.get('/api/user').then((res)=>{
                let user = res.data;
                this.$store.commit('SET_USER', user)
                this.$store.commit('SET_AUTHENTICATION', true)
                localStorage.setItem('auth', true)
            })
        }

    }
}
</script>

<style scoped>

</style>
