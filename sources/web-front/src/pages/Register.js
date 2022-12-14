import { Box, Button, TextField, Typography } from "@mui/material";
import { useState } from "react";
import { useNavigate } from 'react-router-dom'
import ProPage from "../pages/main_page/ProPage.js";
import propage from "../pages/main_page/ProPage.js"

let isPassed = false;

export default function FormRegistration() {

    const [isSignup, setIsSignup] = useState(false);
    const [isSubmit, setIsSubmit] = useState(false);
    const [isPro, setIsPro] = useState(false);
    const [inputs, setInputs] = useState({Genre: "", FirstName: "", Login: "", Email: "", Password: "",});
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
        setInputs({Genr:"", FirstName:"", Login:"", Email:"", Password:""})
    }
    if (isSubmit && !isPassed) {
        if ((inputs.Email === "pro@gmail.com" && inputs.Password === "pro1234")) {
            console.log("OK C EST EGAL À CA")
            setIsPro(true)
            navigate("/pro")
        }
        isPassed = true
        console.log("OK C EST")
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
        setIsSubmit(false)
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
                boxShadow={"5px 5px 10px #ccc"} >
                    <Typography> {isSignup ? "Inscription" : "Connexion"} </Typography>
                    {/* {isSignup && <FormControl fullWidth>
                    <InputLabel id="genre-select-label">Genre</InputLabel>
                    <Select
                        labelId="genre-select-label"
                        id="genre-select"
                        label="Genre"
                        value={inputs}
                    >
                    <MenuItem onChange={handleChange} name="Genre" value={inputs.Genre} >Homme</MenuItem>
                    <MenuItem onChange={handleChange} name="Genre" value={inputs.Genre}>Femme</MenuItem>
                    <MenuItem onChange={handleChange} Lname="Genre" value={inputs.Genre}>Autre</MenuItem>
                    </Select>
                    </FormControl>} */}
                    {isSignup && <TextField margin='normal' type={'text'} name="FirstName" value={inputs.FirstName} onChange={handleChange} placeholder="Prénom"></TextField>}
                    {isSignup && <TextField margin='normal' type={'text'} name="Login" value={inputs.Login} onChange={handleChange} placeholder="Nom"></TextField>}
                    <TextField name="Email" value={inputs.Email} onChange={handleChange} margin='normal' type={'email'} placeholder="Adresse e-mail"></TextField>
                    <TextField margin='normal' type={'password'} value={inputs.Password} name="Password" onChange={handleChange} placeholder="Mot de passe"></TextField>
                    <Button type="submit" sx={{ marginTop: 3, borderRadius: 3}} variant="contained" color="success" > {isSignup ? "Je m'inscris" : "Je me connecte"} </Button>
                    <Button onClick={resetState} sx={{ marginTop: 3, borderRadius: 3}}> {isSignup ? "Connexion" : "Inscription"} </Button>
                </Box>
            </form>
        </div>
    );
}
