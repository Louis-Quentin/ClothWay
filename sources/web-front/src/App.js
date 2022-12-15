import { BrowserRouter as Router, Route, Routes } from "react-router-dom";
import Main from "./pages/main_page/Main";
import FormRegistration from "./pages/Register";
import ProPage from "./pages/main_page/ProPage"

function App() {
  return (
    <div>
      <Router>
        <Routes>
          <Route path="/" element={<Main />} />
          <Route path="/register" element={<FormRegistration />} />
          <Route path="/pro" element={<ProPage />} />
        </Routes>
      </Router>
    </div>
  )
}

export default App;
