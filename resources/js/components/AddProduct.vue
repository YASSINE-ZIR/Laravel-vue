<template>
        <div class="container">
            <div class="row">
                <div class="col-8 mt-3  offset-2 ">
                    <div class="row">
                        <div class="col-12 text-center">
                            <h2 class="mt-3 text-h2 mb-4">add product</h2>
                        </div>
                        <div class=" col-md-12  mt-3">
                            <form
                                @submit.prevent="create_product()"
                                enctype="multipart/form-data"
                                method="post"
                            >
                                <div class="form-group mb-4">
                                    <label for="name">Name</label>
                                    <input
                                        id="name"
                                        v-model="name"
                                        type="text"
                                        class="form-control  "
                                        name="mail"
                                        value="votre nom"
                                        required
                                    />
                                </div>
                                <div class="form-group mb-4">
                                    <label for="name">price</label>
                                    <input
                                        id="name"
                                        type="number"
                                        class="form-control  "
                                        name="mail"
                                        value="votre nom"
                                        v-model="price"
                                        required
                                    />
                                </div>
                                <div class="form-group">
                                    <label for="exampleFormControlTextarea1"
                                        >description</label
                                    >
                                    <textarea
                                        class="form-control"
                                        id="exampleFormControlTextarea1"
                                        rows="3"
                                        v-model="description"
                                        required
                                    ></textarea>
                                </div>

                                <div class="form-group">
                                    <label for="exampleFormControlSelect2"
                                        >Example multiple select</label
                                    >
                                    <select
                                        class="custom-select mr-sm-2"
                                        id="inlineFormCustomSelect"
                                        v-model="category_id"
                                        required
                                    >
                                        <option selected>Choose...</option>
                                        <option
                                            v-for="item in categories"
                                            :key="item.id"
                                            :value="item.id"
                                            >{{ item.name }}</option
                                        >
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="exampleFormControlFile1"
                                        >image</label
                                    >
                                    <input
                                        @change="onImageChange"
                                        type="file"
                                        class="form-control-file"
                                        id="exampleFormControlFile1"
                                        required
                                    />
                                </div>
                                <div
                                    class="form-group mb-4 d-flex flex-column justify-content-center"
                                >
                                    <div class="col-md-8 offset-md-4">
                                        <button
                                            type="submit"
                                            class="btn btn-success"
                                        >
                                            Continuer
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    
</template>
<script>
export default {
    data() {
        return {
            name: "",
            price: 0,
            description: "",
            image: "",
            category_id:'',
            user_id: document
                .querySelector("meta[name='user-id']")
                .getAttribute("content"),
            categories: null
        };
    },
    mounted() {
        axios
            .get("/api/category")
            .then(response => {
                this.categories = response.data;
                console.log(this.categories);
            })
            .catch(err => {
                console.log(err); //Axios entire error message
                console.log(err.response.data.error); //Google API error message
            });
    },
    methods: {
        onImageChange(e) {
            this.image = e.target.files[0];
        },

        create_product() {
            const data = new FormData();
            data.append("_method", "POST");
            data.append("name", this.name);
            data.append("price", this.price);
            data.append("description", this.description);
            data.append("image", this.image);
            data.append("user_id", this.user_id);
             data.append("category_id", this.category_id);
            axios
                .post("/api/product", data)
                .then(response => {
                    console.log(response);
                })
                .catch(err => {
                    //Axios entire error message
                    console.log(err); //Google API error message
                });
        }
    }
};
</script>
<style scoped>
 .container {
      background-color: #f2f2f2 !important;
     
 }
 </style>