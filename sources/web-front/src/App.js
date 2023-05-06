import { BrowserRouter as Router, Route, Routes } from "react-router-dom";
import Main from "./pages/main_page/Main";
import FormRegistration from "./pages/Register";
import ProPage from "./pages/main_page/ProPage"
import GetTheNews from "./pages/main_page/news";

function App() {
  return (
    <div>
      <Router>
        <Routes>
          <Route path="/" element={<Main />} />
          <Route path="/register" element={<FormRegistration />} />
          <Route path="/pro" element={<ProPage />} />
          <Route path="/news" element={<GetTheNews />} />
        </Routes>
      </Router>
    </div>
  )
}

export default App;
