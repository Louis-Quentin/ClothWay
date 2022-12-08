import './App.css';
import { BrowserRouter as Router, Route, Routes } from "react-router-dom";
import Main from "./pages/Main";
import Test from "./pages/Test";

function App() {
  return (
    <div>
      <Router>
        <Routes>
          <Route path="/" element={<Main />} />
          <Route path="/test" element={<Test />} />
        </Routes>
      </Router>
    </div>
  )
}

export default App;
