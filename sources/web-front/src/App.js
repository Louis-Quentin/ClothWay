import './App.css';
import { BrowserRouter as Router, Route, Routes } from "react-router-dom";
import Main from "./pages/Main";
import FormRegistration from "./pages/Register";

function App() {
  return (
    <div>
      <Router>
        <Routes>
          <Route path="/" element={<Main />} />
          <Route path="/register" element={<FormRegistration />} />
        </Routes>
      </Router>
    </div>
  )
}

export default App;
