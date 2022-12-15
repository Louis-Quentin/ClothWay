import { Box, Button, TextField, Typography } from "@mui/material";
import React from 'react';
import { useState } from "react";
import { useNavigate } from 'react-router-dom';

export default function ProPage() {

    const [isSignup, setIsSignup] = useState(false);
    const [isSubmit, setIsSubmit] = useState(false);
    const [inputs, setInputs] = useState({Prix: "", Marque: "", Materiau: ""});
    const navigate = useNavigate();
    const handleChange  = (e) => {
        setInputs((prevState) => ({...prevState,
        [e.target.name] : e.target.value
    }))
    }
    const handleSubmit = (e) => {
        e.preventDefault();
        setIsSubmit(true)
        console.log("INPUTS RENTRÉS : ", inputs)
    }
    const resetState = () => {
        setIsSignup(!isSignup);
        setInputs({Prix:"", Marque:"", Matériau:""})
    }
    //if (isSubmit)
        //navigate("/")
    const [image, setImage] = useState('')
    function handleImage(e) {
        console.log("IMG EST : ", e.target.files)
        const uploadImage = e.target.files[0];
        setImage(e.target.files[0])
    }
    // if (isSubmit) {
    //     /*if ((inputs.Email === "pro@gmail.com" && inputs.Password === "pro1234")) {
    //         console.log("OK C EST EGAL À CA")
    //         navigate("/pro")
    //     }*/
    //     const options = {
    //         method: "POST",
    //         body: JSON.stringify(inputs),
    //         Headers: {
    //             "Content-Type": "application/json"
    //         }
    //     };
    //     fetch("http://localhost:8080/register", options)
    //     .then(response => response.json())
    //     .then(inputs => {
    //         // handle response data
    //         console.log("OK LE BACK A RENVOYER LA RÉPONSE");
    //     })
    //     .catch(error => {
    //         //handle errors
    //     });
    //     setIsSubmit(false)
    // }

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
            <Button type="submit" sx={{ marginTop: 3, borderRadius: 3}} variant="contained" color="success"> Soumettre l'article </Button>
            </Box>
        </form>
    </div>
  )
}
