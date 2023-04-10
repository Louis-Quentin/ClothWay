import {useState} from "react"
import ToolBar from "./main_page/ToolBar"
import validator from "validator"
import {
    Box,
    Button,
    TextField,
    Typography
} from "@mui/material"

export default function FormRegistration() {
    const [isSignup, setIsSignup] = useState(false)
    const [isSubmit, setIsSubmit] = useState(false)
    const [inputs, setInputs] = useState({Email: "", Password: ""})
    const [passwordMessage, setPasswordMessage] = useState('')
    const [canSubmit, setCanSubmit] = useState(false)
    const [errorMessage, setErrorMessage] = useState('')

    const handleChange  = (e) => {
        setInputs((prevState) => ({...prevState,
            [e.target.name] : e.target.value
        }))
    }

    const handleChangePwd = (e) => {
        setInputs((prevState) => ({...prevState,
            [e.target.name] : e.target.value
        }))
        if (validator.isStrongPassword(e.target.value, {
            minLength: 8, minLowercase: 1, minUppercase: 1, minNumbers: 1, minSymbols: 1
        })) {
            setPasswordMessage("Is Strong Password")
            setCanSubmit(true)
        } else {
            setPasswordMessage("Is Not Strong Password")
            setCanSubmit(false)
        }
    }

    const handleSubmit = (e) => {
        if (!isSignup) {
            if (canSubmit) {
                e.preventDefault()
                setIsSubmit(true)
                console.log("INPUTS RENTRÉS : ", inputs)
            }
        } else {
            e.preventDefault()
            setIsSubmit(true)
            console.log("INPUTS RENTRÉS : ", inputs)
        }
    }

    const resetState = () => {
            setIsSignup(!isSignup)
            setInputs({Email:"", Password:""})
    }

    if (isSubmit) {
        const options = {
            method: "POST",
            body: JSON.stringify(inputs),
            Headers: {
                "Content-Type": "application/json",
            },
        }
        console.log(options)
        if (isSignup) {
            fetch("http://localhost:8080/login", options)
                .then(data => {
                    console.log("OK LE BACK A RENVOYER LA RÉPONSE: ", data)
                    if (!data.ok) {
                        console.log("LAAA")
                        setErrorMessage(data.status)
                    }
                })
                .catch(error => {
                    console.log("LA", error)
                });
        }
        else {
            fetch("http://localhost:8080/signup", options)
                .then(data => {
                    console.log("OK LE BACK A RENVOYER LA RÉPONSE: ", data)
                    if (!data.ok) {
                        console.log("LAAA")
                        setErrorMessage(data.status)
                    }
                })
                .catch(error => {
                    console.log(error.message)
                });
        }
        setIsSubmit(false)
    }

    return (
        <div className='Background'>
            <ToolBar/>
            <Box display="flex"
                flexDirection={"column"}
                maxWidth={600}
                margin="auto"
                alignItems={"center"}
                marginTop={20}
                borderRadius={5}
                spacing={5}
                sx={{backgroundColor:'white'}}
            >
                <Typography>
                    {!isSignup ? "Inscription" : "Connexion"}
                </Typography>

                <TextField
                    name="Email"
                    value={inputs.Email}
                    onChange={handleChange}
                    margin='normal'
                    type={'email'}
                    placeholder="Adresse e-mail"
                />

                <TextField
                    name="Password"
                    value={inputs.Password}
                    onChange={(e) => handleChangePwd(e)}
                    margin='normal'
                    type={'password'}
                    placeholder="Mot de passe"
                />
                {passwordMessage === '' ? null :
                    <Typography>
                        {passwordMessage}
                    </Typography>
                }

                <Button
                    onClick={handleSubmit}
                    sx={{marginTop: 3, borderRadius: 3}}
                    variant="contained"
                    color="success"
                >
                    {!isSignup ? "Je m'inscris" : "Je me connecte"}
                </Button>

                <Button
                    onClick={resetState}
                    sx={{marginTop: 3, borderRadius: 3}}
                >
                    {!isSignup ? "Connexion" : "Inscription"}
                </Button>
                {errorMessage === '' ? null :
                    <Typography>
                        {errorMessage}
                    </Typography>
                }
            </Box>
        </div>
    )
}