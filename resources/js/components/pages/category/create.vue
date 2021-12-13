<template>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-6">
            <div class="card mt-5">
                <div class="card-header d-flex justify-content-between align-items-center">
                    <h3>Create Category</h3>
                    <router-link  :to="{name: 'category'}" class="btn btn-success">Back to Category</router-link>
                </div>

                <div class="card-body">
                    <form>
                      <div class="form-group">
                          <label for="name">Category Name</label>
                          <input type="text" id="name" v-model="form.name" class="form-control" placeholder="Category name">
                          <div class="text-danger" v-if="form.errors.has('name')" v-html="form.errors.get('name')" />
                      </div>
                        <div class="form-group">
                            <input type="submit" @click.prevent="createCategory" class="btn btn-success" value="Create">
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
                name: ''
            })
        }
    },
    methods: {
        createCategory(){
            this.form.post('/api/category/create').then((res)=>{
                this.form.name = ''
                this.$toast.success({
                    title:'Success',
                    message:'Category created successfully'
                })
            })
        }
    }
}
</script>


<style scoped>

</style>
