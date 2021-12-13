<template>
<div class="container-fluid">
    <div class="row bg-success">
        <div class="col-12">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <nav class="navbar navbar-expand-lg navbar-light bg-success">
                            <router-link class="navbar-brand" :to="{name: 'home'}">Site Logo</router-link>
                            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon"></span>
                            </button>

                            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                                <ul class="navbar-nav ml-auto" v-if="auth">
                                    <li class="nav-item">
                                        <router-link active-class="active" exact class="nav-link" :to="{name: 'category'}">Category</router-link>
                                    </li>
                                    <li class="nav-item">
                                        <router-link active-class="active" exact class="nav-link" :to="{name: 'product'}">Product</router-link>
                                    </li>
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            {{ user.name }}
                                        </a>
                                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                            <router-link class="dropdown-item"  :to="{name: 'dashboard'}">Dashboard</router-link>
                                            <div class="dropdown-divider"></div>
                                            <a @click="logout" class="dropdown-item" href="#">Logout</a>
                                        </div>
                                    </li>
                                </ul>
                                <ul class="navbar-nav ml-auto" v-else>
                                    <li class="nav-item">
                                        <router-link active-class="active" exact class="nav-link" :to="{name: 'home'}">Home</router-link>
                                    </li>
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            Account
                                        </a>
                                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                            <router-link  class="dropdown-item" :to="{name: 'login'}">Login</router-link>
                                            <div class="dropdown-divider"></div>
                                            <router-link  class="dropdown-item" :to="{name: 'register'}">Register</router-link>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </nav>
                    </div>
                    </div>
                </div>
            </div>
    </div>
</div>
</template>

<script>
export default {
    computed: {
      auth(){
          return this.$store.getters.getAuthentication
      },
      user(){
          return this.$store.getters.getUser
      }
    },
    methods: {
        logout(){
            axios.post('/logout').then((res)=>{
                this.$toast.success({
                    title:'Success',
                    message:'Logout successfully'
                })
                this.$store.commit("SET_AUTHENTICATION", false)
                localStorage.removeItem('auth')
                this.$router.push({name: 'login'})
            })
        }
    }
}
</script>

<style scoped>
.navbar .active{
    color: crimson !important;
    font-weight: bold !important;
}
</style>
