<template>
    <div class="container">
        <div class="row justify-content-center py-5">
            <div class="col-12 d-flex justify-content-between flex-row-reverse">
                <a class=" bg-success p-2 text-white mb-2" href="/home/add-product"
                    ><i class="fa fa-plus "></i> add</a
                >
                <h2 class="text-h2">All products</h2>
            </div>
            <div class="col-12 table-responsive" >
                <table class="table text-center  ">
                    <thead>
                        <tr>
                            <th scope="col">image</th>
                            <th scope="col">name</th>
                            <th scope="col">description</th>
                            <th scope="col">price</th>
                            <th scope="col">category</th>
                            <th scope="col">*</th>
                        </tr>
                    </thead>
                    <tbody >
                        <tr  v-for="item in products" :key="item.id"  >
                            <td>
                                <img
                                    :src="img_path+item.image"
                                    :alt="item.name"
                                    
                                />
                            </td>
                            <td class="pt-auto">{{ item.name }}</td>
                            <td>{{ item.description }}</td>
                            <td>{{ item.price }}</td>
                            <td>{{ item.category.name }}</td>
                            <td>
                                <i
                                    class="fa fa-edit p-2 bg-warning  text-white"
                                    @click="showAddSongModal(item.slug)"
                                ></i>
                                <i
                                    class="fa fa-trash p-2 bg-danger mt-2  text-white"
                                    @click="show_modal_delet(item.slug)"
                                    
                                ></i>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <nav aria-label="Page navigation example">
                    <ul class="pagination justify-content-center">
                        <li class="page-item">
                            <a
                                class="page-link"
                                href="#"
                                @click="first_page(paginate.first_page_url)"
                                >first</a
                            >
                        </li>
                        <li
                            class="page-item"
                            v-for="item in paginate.last_page"
                            :key="item.id"
                            @click="pageNum(item)"
                        >
                            <a class="page-link" href="#">{{ item }}</a>
                        </li>
                        <li class="page-item">
                            <a
                                class="page-link"
                                href="#"
                                @click="last_page(paginate.last_page_url)"
                                >last</a
                            >
                        </li>
                    </ul>
                </nav>
            </div>
            <div
                class="modal fade"
                id="addSongModal"
                tabindex="-1"
                role="dialog"
                aria-labelledby="exampleModalLabel"
                aria-hidden="true"
                
            >
                <div class="modal-dialog" role="document">
                    <div class="modal-content" >
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">
                                Modal title
                            </h5>
                            <button
                                type="button"
                                class="close"
                                data-dismiss="modal"
                                aria-label="Close"
                            >
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form
                                @submit.prevent="edit_product(productBySlug.id)"
                                enctype="multipart/form-data"
                                method="post"
                                v-if="productBySlug"
                            >
                                <div class="form-group mb-4">
                                    <label for="name">Name</label>
                                    <input
                                        id="name"
                                        v-model="name"
                                        type="text"
                                        class="form-control  "
                                        name="mail"
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
                                <!-- <div class="form-group">
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
                                </div> -->
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
            <div
                class="modal fade"
                id="ModalDelet"
                ref="ModalDelet"
               
                tabindex="-1"
                role="dialog"
                aria-labelledby="exampleModalLabel2"
                aria-hidden="true"
               
            >
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">
                                Modal title
                            </h5>
                            <button
                                type="button"
                                class="close"
                                data-dismiss="modal"
                                aria-label="Close"
                            >
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body" v-if="productBySlug">
                            <p>Do you really want to delete these products?</p>
                           
                            <button
                            
                                type="button"
                                class="btn btn-danger"
                                @click="delet_prod(productBySlug.id)"
                            >
                               Delet
                            </button>
                        </div>
                       
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
            img_path:'storage/products/',
            products: null,
            paginate: null,
            showModal: false,
            productBySlug: null,
            name: "",
            price: 0,
            description: "",
            image: "",
            categories: [],
            category_id: "",
            user_id: document
                .querySelector("meta[name='user-id']")
                .getAttribute("content")
        };
    },
    mounted() {
        this.all_products();
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
        pageNum(val) {
            axios
                .get("api/product?page=" + val)
                .then(response => {
                    this.products = response.data.data;
                    console.log(response.data);
                })
                .catch(err => {
                    console.log(err); //Axios entire error message
                    console.log(err.response.data.error); //Google API error message
                });
        },
        first_page(val) {
            axios
                .get(val)
                .then(response => {
                    this.products = response.data.data;
                    console.log(response.data);
                })
                .catch(err => {
                    console.log(err); //Axios entire error message
                    console.log(err.response.data.error); //Google API error message
                });
        },
        last_page(val) {
            axios
                .get(val)
                .then(response => {
                    this.products = response.data.data;
                    console.log(response.data);
                })
                .catch(err => {
                    console.log(err); //Axios entire error message
                    console.log(err.response.data.error); //Google API error message
                });
        },
        showAddSongModal(val) {
            $("#addSongModal").modal("show");
            this.get_product(val);
        },
        show_modal_delet(val) {
            
            $(this.$refs.ModalDelet).modal("show");
            this.get_product(val);
        },
        delet_prod(id) {
            $(this.$refs.ModalDelet).modal("hide");
            axios
                .delete("api/product/" + id, )
                .then(response => {
                    console.log(response);
                    this.all_products();
                })
                .catch(err => {
                    console.log(err); //Axios entire error message
                    console.log(err.response.data.error); //Google API error message
                });
        },
        get_product(val) {
            axios
                .get("api/product/" + val)
                .then(response => {
                    this.productBySlug = response.data[0];
                    if (this.productBySlug) {

                        this.name = this.productBySlug.name;
                        this.price = this.productBySlug.price;
                        this.description = this.productBySlug.description;
                        this.category_id = this.productBySlug.category_id;
                    }
                    console.log(response.data);
                })
                .catch(err => {
                    console.log(err); //Axios entire error message
                    console.log(err.response.data.error); //Google API error message
                });
        },
        edit_product(id) {
            $("#addSongModal").modal("hide");
            //    const data = new FormData();
            //     data.append("name", this.name);
            //     data.append("price", this.price);
            //     data.append("description", this.description);
            //     data.append("image", this.image);
            //     data.append("user_id", this.user_id);
            //      data.append("category_id", this.category_id);
            let form = {
                price: this.price,
                description: this.description,
                name: this.name,
                category_id: this.category_id,
                user_id: this.user_id
            };

            axios
                .put("api/product/" + id, { ...form })
                .then(response => {
                    console.log(response);
                    this.all_products();
                })
                .catch(err => {
                    console.log(err); //Axios entire error message
                    console.log(err.response.data.error); //Google API error message
                });
        },
        all_products() {
            axios
                .get("api/product")
                .then(response => {
                    this.products = response.data.data;
                    this.paginate = response.data;
                    console.log(response.data);
                })
                .catch(err => {
                    console.log(err); //Axios entire error message
                    console.log(err.response.data.error); //Google API error message
                });
        },
    }
};
</script>
<style scoped>
 .container {
      background-color: #f2f2f2  !important;
     
 }
img{
    width: 100px !important;
    height: 100px !important;
  }
  tr {
      padding-top: auto !important;
      padding-bottom: auto !important;
  }
</style>
