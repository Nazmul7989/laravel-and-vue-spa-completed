<template>
    <div class="container">
        <div class="row d-flex justify-content-center">
            <div class="col-7">
                <div class="card mt-5">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <h3>Edit Product</h3>
                        <router-link :to="{name: 'product'}" class="btn btn-success">Back to Product</router-link>
                    </div>

                    <div class="card-body">
                        <form>
                            <div class="row">
                                <div class="col-8">
                                    <div class="form-group">
                                        <label for="image">Product Image</label>
                                        <input type="file" id="image" @change="onImageChange" class="form-control">
                                        <div class="text-danger" v-if="form.errors.has('image')" v-html="form.errors.get('image')" />
                                    </div>
                                </div>
                                <div class="col-4">
                                    <div>
                                        <img :src="editImage" style="height: 60px;width: 120px;" class="img-fluid mt-4 ml-5" :alt="form.name">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="name">Product Name</label>
                                <input type="text" id="name" v-model="form.name" class="form-control" placeholder="Product name">
                                <div class="text-danger" v-if="form.errors.has('name')" v-html="form.errors.get('name')" />
                            </div>
                            <div class="form-group">
                                <label for="price">Product Price</label>
                                <input type="text" id="price" v-model="form.price" class="form-control" placeholder="Product price">
                                <div class="text-danger" v-if="form.errors.has('price')" v-html="form.errors.get('price')" />
                            </div>
                            <div class="form-group">
                                <label for="category">Product Category</label>
                                <select id="category"  v-model="form.category_id" class="form-control">
                                    <option value="" selected class="d-none">Select a Category</option>
                                    <option v-for="category in categories" :key="category.id" :value="category.id" >{{ category.name }}</option>
                                </select>
                                <div class="text-danger" v-if="form.errors.has('category_id')" v-html="form.errors.get('category_id')" />
                            </div>
                            <div class="form-group">
                                <label for="description">Product Description</label>
                                <textarea cols="30" rows="4"  id="description" v-model="form.description" class="form-control" placeholder="Product description"></textarea>
                                <div class="text-danger" v-if="form.errors.has('description')" v-html="form.errors.get('description')" />
                            </div>
                            <div class="form-group">
                                <input type="submit" @click.prevent="updateProduct" class="btn btn-success" value="Update Product">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import Form from 'vform'


export default {
    data(){
        return{
            form: new Form({
                image: '',
                name: '',
                price: '',
                category_id: '',
                description: ''
            }),
            editImage: '',
            categories: []
        }
    },
    methods: {

        loadProduct(){

            let id = this.$route.params.id;

            axios.get('/api/product/edit/' + id ).then((res)=>{
                this.form.name = res.data.name;
                this.form.price = res.data.price;
                this.form.category_id = res.data.category_id;
                this.form.description = res.data.description;
                this.editImage = res.data.image;
            })

        },
        loadCategory(){
            axios.get('/api/category').then((res)=>{
                this.categories = res.data
            })
        },
        updateProduct(){
            let id = this.$route.params.id;
            this.form.post('/api/product/'+ id,this.$objectToFD(this.form)).then((res)=>{

                this.$toast.success({
                    title:'Success',
                    message:'Product updated successfully'
                })
                this.editImage = res.data.image;
                // this.loadProduct()
                // this.$router.push({name: 'product'});

            })
        },
        onImageChange(e){
            let file = e.target.files[0];
            this.form.image = file;
        }

    },
    mounted() {
        this.loadProduct();
        this.loadCategory()
    }
}
</script>


<style scoped>

</style>
