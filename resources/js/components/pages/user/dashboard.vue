<template>
    <div class="container mt-4">
        <div class="row justify-content-center">
            <div class="col-3">
                <div class="list-group">
                    <router-link :to="{name: 'dashboard'}" active-class="active" exact class="list-group-item list-group-item-action">Dashboard</router-link>
                    <router-link :to="{name: 'profile'}" active-class="active" exact class="list-group-item list-group-item-action">User Profile</router-link>
                </div>
            </div>
            <div class="col-9">
                <div class="card">
                    <div class="card-header">{{getMessage }} <span class="text-success font-weight-bold">{{user.name}}</span></div>

                    <div class="card-body">
                       <p> This is a dashboard for user</p>

                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
export default {

    computed: {
        getMessage(){
            return this.$store.getters.getMessage
        },
        user(){
            return this.$store.getters.getUser
        }
    }
}
</script>

<style scoped>

</style>
