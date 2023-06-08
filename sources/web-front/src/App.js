import { BrowserRouter as Router, Route, Routes } from "react-router-dom";
import Main from "./pages/main_page/Main";
import FormRegistration from "./pages/Register";
import ProPage from "./pages/main_page/ProPage"
import GetTheNews from "./pages/main_page/news";
import ProductSearch from "./pages/main_page/Clothes";
import NoClothesYet from "./pages/main_page/Clothes";
import FormRegistrationPartner from "./pages/RegisterPartner";
import Privacy from "./pages/main_page/Privacy";

function App() {
  return (
    <div>
      <Router>
        <Routes>
          <Route path="/" element={<Main />} />
          <Route path="/register" element={<FormRegistration />} />
          <Route path="/register_partner" element={<FormRegistrationPartner/>} />
          <Route path="/pro" element={<ProPage />} />
          <Route path="/news" element={<GetTheNews />} />
          <Route path="/clothes" element={<NoClothesYet />} />
          <Route path="/products" element={<ProductSearch></ProductSearch>} />
          <Route path="/privacy" element={<Privacy></Privacy>} />
        </Routes>
      </Router>
    </div>
  )
}

export default App;
