<template>
    <div class="container">
        <div class="row">
            <div class="col text-left">
                <h2>Editar Libro</h2>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <div class="card">
                    <div class="card-body">
                        <form @submit="onSubmit">
                            <div class="form-group row">
                                <label for="title" class="col-sm-2 col-form-label">Titulo</label>
                                <div class="col-sm-6">
                                    <input v-model.trim="form.title" type="text" name="title" placeholder="Titulo" class="form-control">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="description" class="col-sm-2 col-form-label">Descripcion</label>
                                <div class="col-sm-6">
                                    <textarea v-model.trim="form.description" class="form-control" name="description" placeholder="Descripcion"  cols="30" rows="3"></textarea>
                                </div>
                            </div>
                            <div class="rows">
                                <div class="col text-left">
                                    <b-button type="submit" variant="primary"> Editar </b-button>
                                    <b-button type="submit" class="btn-large-space" :to="{ name: 'ListBook'}"> Cancelar </b-button>

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
import axios from 'axios'

export default {
    data(){
        return {
            bookId: this.$route.params.bookId,
            form:{
                title:'',
                description:''
            }
        }
    },
    methods: {                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
        onSubmit(evt){           
            evt.preventDefault()
            const path = `http://127.0.0.1:8000/api/v1.0/books/${this.bookId}/`
            //console.log(`Quince es ${a + b} y\nno ${2 * a + b}.`);                       
            axios.put(path,this.form)
            .then(res =>{
                this.form.title = res.data.title;                                                                                                                           
                this.form.description = res.data.description;
                alert("Book Updated")
            })
            .catch(err =>{                                                                                                                          
                console.log("Hubo un error")
                console.log(err)
            })
        },
        getBook(){
                const path = `http://127.0.0.1:8000/api/v1.0/books/${this.bookId}/`
                //console.log(`Quince es ${a + b} y\nno ${2 * a + b}.`);            
                axios.get(path)
                .then(res =>{
                    this.form.title = res.data.title;
                    this.form.description = res.data.description;
                })
                .catch(err =>{
                    console.log("Hubo un error")
                    console.log(err)
                })
            }
    },
        created() {
            this.getBook();
            
        },
    }
</script>
<style lang="css" scoped>

</style>