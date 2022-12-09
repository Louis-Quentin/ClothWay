import { Box, Button, TextField, Typography } from "@mui/material";
import { useState } from "react";

export default function FormRegistration() {

    const [isSignup, setIsSignup] = useState(false);
    console.log(isSignup);

    return (
        <div>
            <form>
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
                    {isSignup && <TextField margin='normal' type={'text'} placeholder="Prénom"></TextField>}
                    {isSignup && <TextField margin='normal' type={'text'} placeholder="Nom"></TextField>}
                    <TextField margin='normal' type={'email'} placeholder="Adresse e-mail"></TextField>
                    <TextField margin='normal' type={'password'} placeholder="Mot de passe"></TextField>
                    <Button sx={{ marginTop: 3, borderRadius: 3}} variant="contained" color="success" > {isSignup ? "Je m'inscris" : "Je me connecte"} </Button>
                    <Button onClick={()=>setIsSignup(!isSignup)} sx={{ marginTop: 3, borderRadius: 3}} > {isSignup ? "Connexion" : "Inscription"} </Button>
                </Box>
            </form>
        </div>
    );
}