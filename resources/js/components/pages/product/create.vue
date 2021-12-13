<template>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-8">
                <div class="card mt-5">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <h3>Create Product</h3>
                        <router-link  :to="{name: 'product'}" class="btn btn-success">Back to Product</router-link>
                    </div>

                    <div class="card-body">
                        <form>
                            <div class="form-group">
                                <label for="image">Product Image</label>
                                <input type="file" id="image" @change="onImageChange" class="form-control">
                                <div class="text-danger" v-if="form.errors.has('image')" v-html="form.errors.get('image')" />
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
                                <input type="submit" @click.prevent="createProduct" class="btn btn-success" value="Add Product">
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
            categories: []
        }
    },
    methods: {
        createProduct(){
            this.form.post('/api/product/create',this.$objectToFD(this.form)).then((res)=>{
                this.form.image = ''
                this.form.name = ''
                this.form.price = ''
                this.form.category_id = ''
                this.form.description = ''

                this.$toast.success({
                    title:'Success',
                    message:'Product created successfully'
                })

            })
        },
        onImageChange(e){
            let file = e.target.files[0];
            this.form.image = file;
        },
        loadCategory(){
            axios.get('/api/category').then((res)=>{
               this.categories = res.data
            })
        }
    },
    mounted() {
        this.loadCategory()
    }
}
</script>


<style scoped>

</style>
