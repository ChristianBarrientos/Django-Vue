<template lang="html">
    <div class="container">
        <div class="row">
            <div class="col text-left">
                <h2>Listado de Libros</h2>
                <div class="col-md-12">
                    <b-table striped hover :items="books" :fields="fields"> 
                        <template slot="action" slot-scoped="d ata">
                            <b-button size="sm" variant="primary">
                                Editar
                            </b-button>
                            <b-button size="sm" variant="danger">
                                Eliminar
                            </b-button>
                        </template>
                    </b-table>

                </div>
            </div>
        </div>
    </div>
</template>
<script>
import axios from 'axios';

export default {
    data (){
        return {
            fields:[
                { key: 'title', label:'Titulo'},
                { key: 'description', label:'Descripcion'},
                { key: 'action', label:''},
            ],
            books: []
        }
    },
    methods: {
        getBooks(){
            const apiDjango = "http://localhost:8000/api/v1.0/books/?format=json";
            axios.get(apiDjango)
            .then(res =>{
                this.books = res.data;
            })
            .catch(err =>{
                console.log(err);
                
            })
        }
    },
    created() {
        this.getBooks()
    },
    
}
</script>
<style lang="css" scoped>
    
</style>