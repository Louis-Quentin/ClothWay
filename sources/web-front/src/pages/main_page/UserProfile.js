import {useState} from "react"
import ToolBar from "./ToolBar"
import { useNavigate } from 'react-router-dom';

export default function UserProfile() {
    const [inputs, setInputs] = useState({Pseudo: "", Email: ""})
    const [LogMessage, setLogMessage] = useState('')
    const navigate = useNavigate();
    const options = {
        method: "GET",
        body: JSON.stringify(inputs),
        Headers: {
            "Content-Type": "application/json",
        },
    }

    fetch("http://localhost:8080/get_user_profile", options)
        .then(data => {
            console.log("load profile: ", data);
            if (!data.ok) {
                //setErrorMessage(data.status)
                console.log("failed");
            }
            else {
                console.log("success");
            }
        })
        .catch(error => {
            console.log(error.message)
        });
    if (LogMessage === "failed") {
        //console.log("in check success");
        navigate("/register");
    }
    return <div>user profile !</div>;
}