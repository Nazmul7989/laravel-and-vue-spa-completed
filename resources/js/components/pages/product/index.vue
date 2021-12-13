<template>
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="card mt-3">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <h3>All Products</h3>
                        <router-link :to="{name: 'create-product'}" class="btn btn-success">Add Product</router-link>
                    </div>

                    <div class="card-body" v-if="products.length">
                        <table class="table table-bordered">
                            <thead>
                            <tr>
                                <th>Id</th>
                                <th>Image</th>
                                <th>Name</th>
                                <th>Slug</th>
                                <th>Price</th>
                                <th>Category</th>
                                <th>Description</th>
                                <th style="width: 150px">Action</th>
                            </tr>
                            </thead>
                            <tbody>
                                <tr v-for="product in products" :key="product.id">
                                    <td>{{ product.id }}</td>
                                    <td>
                                        <img :src="'assets/images/products/'+ product.image" style="width: 150px; height: 80px;" alt="">
                                    </td>
                                    <td>{{ product.name }}</td>
                                    <td>{{ product.slug }}</td>
                                    <td>{{ product.price }}</td>
                                    <td>{{ product.category.name }}</td>
                                    <td>{{ product.description }}</td>
                                    <td style="width: 150px">
                                        <router-link :to="{name: 'edit-product', params: {id: product.id, name: product.name} }" class="btn btn-success">Edit</router-link>
                                        <button @click.prevent="deleteCategory(product.id)" class="btn btn-danger">Delete</button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="row text-center my-5" v-else>
                        <div class="col-12">
                            <h5 >No Product Found</h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import Swal from "sweetalert2";


export default {
    data(){
        return{
            products: []
        }
    },
    methods: {
        loadProducts(){
            axios.get('/api/product').then((res)=>{
                this.products = res.data;
            })
        },
        deleteCategory(id){
            Swal.fire({
                title: 'Are you sure?',
                text: "You won't be able to revert this!",
                icon: 'warning',
                width: 400,
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, delete it!'
            }).then((result) => {
                if (result.isConfirmed) {
                    axios.delete('/api/product/'+ id).then((res)=>{
                        this.loadProducts();
                    })

                    // let index = this.categories.indexOf(id);
                    //  this.categories.splice(index,1)
                    Swal.fire(
                        'Deleted!',
                        'Your product has been deleted.',
                        'success'
                    )
                }
            })
        }

    },
    mounted() {
        this.loadProducts();
    }
}
</script>

<style scoped>

</style>
