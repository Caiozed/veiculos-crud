import axios from 'axios'

export default{
    update(veiculo){
        return axios.patch(`api/v1/veiculos/${veiculo.id}`, {veiculo: veiculo })
    },
    create(veiculo){
        return axios.post("api/v1/veiculos", {veiculo: veiculo })
    },
    delete(id){
        return axios.delete(`api/v1/veiculos/${id}`)
    },
    getOne(id){
        return axios.get(`api/v1/veiculos/${id}`)
    },
    get(){
        return axios.get("api/v1/veiculos")
    }
}