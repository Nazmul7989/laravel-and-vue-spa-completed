<template>
    <div class="container mt-4">
        <div class="row">
            <div class="col-9">
                <div class="card">
                    <div class="card-header">
                        <h3> {{ product.name }} </h3>
                    </div>
                    <div class="card-body">
                        <p><img :src="product.image " alt=""></p>
                        <p v-if="product.category"><span class="badge badge-danger">{{ product.category.name }}</span></p>
                        <p v-else><span class="badge badge-danger">{{ product.category_id }}</span></p>
                        <h5>Price: TK {{ product.price }}</h5>
                        <p>{{ product.description }}</p>
                    </div>
                </div>
            </div>
            <div class="col-3">
                <div>
                   <div class="card">
                       <router-link :to="{name: 'home'}" class="btn btn-success">Back to Home</router-link>
                   </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    data(){
        return{
            product: {}
        }
    },
    methods: {
        async loadProduct(){
            let  id = this.$route.params.id;

            await axios.get('/api/product/show/' + id).then( (response)=>{
                this.product = response.data

            }).catch(()=>{})
        },
    },
    mounted() {
        this.loadProduct()
    }
}
</script>

<style scoped>

</style>
