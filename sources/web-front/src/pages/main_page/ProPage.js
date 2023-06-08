import { Box, Button, TextField, Typography } from "@mui/material";
import React from 'react';
import { useState } from "react";
import { useNavigate } from 'react-router-dom';

let isPassed = false

export default function ProPage() {

    const [isSignup, setIsSignup] = useState(false);
    const [isSubmit, setIsSubmit] = useState(false);
    const [inputs, setInputs] = useState({Price: "", Brand: "", Materials: "", Type: "", Description: "", Picture: "",
    Greenhouse_gaz_conso: "", Water_conso:"", Quality_product:"", Conditions_working:"", Workers_salary:"", Factory:"",
    Pre_wash:"", Packaging:"", Original_country:"", Means_of_transports:"", Score:"", Water_score:"", Materials_score:"", Gaz_score:""});
    const navigate = useNavigate();
    console.log("in pro page ??");
    const handleChange  = (e) => {
        setInputs((prevState) => ({...prevState,
        [e.target.name] : e.target.value
    }))
    }
    const handleSubmit = (e) => {
        e.preventDefault();
        setIsSubmit(true)
    }
    const resetState = () => {
        setIsSignup(!isSignup);
        setInputs({Price:"", Brand:"", Materials:""})
    }
    const [image, setImage] = useState('')
    function handleImage(e) {
        const uploadImage = "../../images/products/" + e.target.files[0].name;
        //console.log("IMG TEST", uploadImage)
        inputs.Picture = uploadImage
        //console.log("img", inputs.Img)
        setImage(e.target.files[0])
    }
    if (isSubmit && !isPassed) {
        isPassed = true
        //console.log("OK")
        inputs.Type = "Bas"
        //console.log(inputs)
        const options = {
            method: "POST",
            body: JSON.stringify(inputs),
            Headers: {
                "Content-Type": "application/json"
            }
        };
        fetch("http://localhost:8080/upload_cloth", options)
        .then(response => response.json())
        .then(inputs => {
            // handle response data
            console.log("OK LE BACK A RENVOYER LA RÉPONSE");
        })
        .catch(error => {
            //handle errors
        });
    }
  return (
    <div>
        <form onSubmit={handleSubmit}>
            <Box display="flex"
                flexDirection={"column"}
                maxWidth={600}
                margin="auto"
                alignItems={"center"}
                marginTop={20}
                borderRadius={5}
                spacing={5}
                boxShadow={"5px 5px 10px #ccc"}>
            <Typography paddingBottom={10}>Veuillez entrer les informations requises</Typography>
            <input type="file" name='file' onChange={handleImage} ></input>
            <TextField name="Price" margin='normal' value={inputs.Price} type={'number'} placeholder="Prix" onChange={handleChange}></TextField>
            <TextField name="Brand" margin='normal' value={inputs.Brand} type="text" placeholder="Marque" onChange={handleChange}></TextField>
            <TextField name="Materials" margin='normal' value={inputs.Materials} type={'text'} placeholder="Matériaux utilisés" onChange={handleChange}></TextField>
            <TextField name="Description" margin='normal' value={inputs.Description} type={'text'} placeholder="Description du produit " onChange={handleChange}></TextField>
            {/* <TextField name="Materiau" margin='normal' value={inputs.Materiau} type={'text'} placeholder="Matériaux utilisés" onChange={handleChange}></TextField> */}
            <select>
                <option value={inputs.Type} onChange={handleChange}>Haut</option>
                <option value={inputs.Type} onChange={handleChange}>Bas</option>
                <option value={inputs.Type} onChange={handleChange}>Chaussure</option>
            </select>
            <Button type="submit" sx={{ marginTop: 3, borderRadius: 3}} variant="contained" color="success"> Soumettre l'article </Button>
            </Box>
        </form>
    </div>
  )
}
