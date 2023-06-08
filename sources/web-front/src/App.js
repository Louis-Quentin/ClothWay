import { BrowserRouter as Router, Route, Routes } from "react-router-dom";
import Main from "./pages/main_page/Main";
import FormRegistration from "./pages/Register";
import ProPage from "./pages/main_page/ProPage"
import GetTheNews from "./pages/main_page/news";
import ProductSearch from "./pages/main_page/Clothes";
import NoClothesYet from "./pages/main_page/Clothes";
import FormRegistrationPartner from "./pages/RegisterPartner";
<<<<<<< HEAD
import Privacy from "./pages/main_page/Privacy";
=======
import UserProfile from "./pages/main_page/UserProfile";
>>>>>>> d4068444741c4163590f821370352190c4dd332a

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
<<<<<<< HEAD
          <Route path="/privacy" element={<Privacy></Privacy>} />
=======
          <Route path="/user_profile" element={<UserProfile></UserProfile>} />
>>>>>>> d4068444741c4163590f821370352190c4dd332a
        </Routes>
      </Router>
    </div>
  )
}

export default App;
