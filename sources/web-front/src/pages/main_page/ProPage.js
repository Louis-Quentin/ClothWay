import { Box, Button, TextField, Typography } from "@mui/material";
import React from 'react';
import { useState } from "react";
import { useNavigate } from 'react-router-dom';

export default function ProPage() {

    const [isSignup, setIsSignup] = useState(false);
    const [isSubmit, setIsSubmit] = useState(false);
    const [inputs, setInputs] = useState({Prix: "", Marque: "", Materiau: "", Type: "", Img: "../../images/"});
    const navigate = useNavigate();
    const handleChange  = (e) => {
        setInputs((prevState) => ({...prevState,
        [e.target.name] : e.target.value
    }))
    }
    const handleSubmit = (e) => {
        e.preventDefault();
        setIsSubmit(true)
        //console.log("INPUTS RENTRÉS : ", inputs)
    }
    const resetState = () => {
        setIsSignup(!isSignup);
        setInputs({Prix:"", Marque:"", Matériau:""})
    }
    if (isSubmit)
        navigate("/")
    const [image, setImage] = useState('')
    function handleImage(e) {
        const uploadImage = "../../images/" + e.target.files[0].name;
        //console.log("IMG TEST", uploadImage)
        inputs.Img = uploadImage
        //console.log("img", inputs.Img)
        setImage(e.target.files[0])
    }
    if (isSubmit) {
        //console.log(inputs)
        const options = {
            method: "POST",
            body: JSON.stringify(inputs),
            Headers: {
                "Content-Type": "application/json"
            }
        };
        fetch("http://localhost:8080/register", options)
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
            <TextField name="Prix" margin='normal' value={inputs.Prix} type={'number'} placeholder="Prix" onChange={handleChange}></TextField>
            <TextField name="Marque" margin='normal' value={inputs.Marque} type="text" placeholder="Marque" onChange={handleChange}></TextField>
            <TextField name="Materiau" margin='normal' value={inputs.Materiau} type={'text'} placeholder="Matériaux utilisés" onChange={handleChange}></TextField>
            {/* <TextField name="Materiau" margin='normal' value={inputs.Materiau} type={'text'} placeholder="Matériaux utilisés" onChange={handleChange}></TextField> */}
            <select>
                <option>Haut</option>
                <option>Bas</option>
                <option>Chaussure</option>
            </select>
            <Button type="submit" sx={{ marginTop: 3, borderRadius: 3}} variant="contained" color="success"> Soumettre l'article </Button>
            </Box>
        </form>
    </div>
  )
}