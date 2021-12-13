<template>
<div class="container">
    <div class="row">
        <div class="col-12">
            <div class="card mt-3">
                <div class="card-header d-flex justify-content-between align-items-center">
                    <h3>All Category</h3>
                    <router-link :to="{name: 'create-category'}" class="btn btn-success">Add Category</router-link>
                </div>

                <div v-if="categories.length" class="card-body">
                   <table class="table table-bordered">
                       <thead>
                            <tr>
                                <th>Id</th>
                                <th>Name</th>
                                <th>Slug</th>
                                <th style="width: 150px">Action</th>
                            </tr>
                       </thead>
                       <tbody>
                           <tr v-for="category in categories" :key="category.id">
                               <td>{{ category.id }}</td>
                               <td>{{ category.name }}</td>
                               <td>{{ category.slug }}</td>
                               <td style="width: 150px">
    <!--                               <router-link :to="{name: 'edit-category', params: {slug: category.slug, id: category.id, name: category.name}, query: {name: category.name} }" class="btn btn-primary">Edit</router-link>-->
                                   <router-link :to="{name: 'edit-category', params: {id: category.id, name: category.name} }" class="btn btn-success">Edit</router-link>
                                   <button @click.prevent="deleteCategory(category.id)" class="btn btn-danger">Delete</button>
                               </td>
                           </tr>
                       </tbody>
                   </table>
                </div>
                <div class="row text-center my-5" v-else>
                    <div class="col-12">
                        <h5>No Category Found</h5>
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
            categories: []
        }
    },
 methods: {
     loadCategories(){
         axios.get('/api/category').then((res)=>{
             this.categories = res.data;
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
                 axios.delete('/api/category/'+ id).then((res)=>{
                     this.loadCategories();
                 })

                 // let index = this.categories.indexOf(id);
                 //  this.categories.splice(index,1)
                 Swal.fire(
                     'Deleted!',
                     'Your file has been deleted.',
                     'success'
                 )
             }
         })
     }

 },
    mounted() {
        this.loadCategories();
    }
}
</script>

<style scoped>

</style>
