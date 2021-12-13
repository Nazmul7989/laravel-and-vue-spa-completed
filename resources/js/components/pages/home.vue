<template>
    <div class="container">
        <div class="row" v-if="apiCallLoaded">
            <div class="col-3"  v-for="product in products" :key="product.id">
               <div class="card mt-4">
                   <img :src="product.image" style="height: 160px" class="card-img-top" alt="">
                   <div class="card-body">
                       <span class="badge badge-danger mb-2">{{ product.category.name }}</span>
                       <h5 class="card-title">{{ product.name }}</h5>
                       <h6>TK {{ product.price }}</h6>
                       <p class="card-text">{{ product.description }}</p>
                       <router-link :to="{name: 'show-product', params: {id: product.id}}" class="btn btn-success card-link">Details</router-link>
                   </div>
               </div>
            </div>
        </div>
        <div class="row text-center my-5">
            <div class="col-12">
                <button @click="loadMoreProducts(next_page_url)" :disabled="!next_page_url" class="btn btn-success px-3">Load More Products</button>
<!--                <pagination :data="products" @pagination-change-page="loadProducts"></pagination>-->
<!--                <pagination :data="products" @pagination-change-page="loadProducts">-->
<!--                    <span slot="prev-nav"> Previous</span>-->
<!--                    <span slot="next-nav">Next </span>-->
<!--                </pagination>-->
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        data(){
            return{
               products: [],
                next_page_url: null,
                apiCallLoaded: false
            }
        },
        mounted() {
            this.loadProducts()
        },
        methods: {
            loadProducts(){
                 axios.get('/api/products').then( (response)=>{
                    this.products = response.data.data
                     this.next_page_url = response.data.next_page_url
                     this.apiCallLoaded = true
                })
            },
            loadMoreProducts(url){
                axios.get(url).then( (response)=>{

                    let products = response.data.data
                    products.forEach(element=>{
                        this.products.push(element)
                    })
                    this.next_page_url = response.data.next_page_url
                })
            }
            //Laravel and Vue pagination
            // loadProducts(page = 1){
            //     axios.get('/api/products?page=' + page).then( (response)=>{
            //         console.log(response.data)
            //         this.products = response.data
            //     })
            // }
        }
    }
</script>
