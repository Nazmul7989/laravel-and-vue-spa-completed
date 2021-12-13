<template>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-5">
                <div class="card badge-secondary shadow mt-5">
                    <div class="card-body">
                        <h2>Opps! 404 Not Found.</h2>
                        <router-link :to="{name: 'home'}" class="btn btn-success mt-4">Go to Home</router-link>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
export default {

}
</script>

<style scoped>

</style>
