import ToolBar from "./ToolBar";
import Presentation from "./Presentation";
import SetShopList from "../Main_page_components/ShopList"
import Slide from "./Slide";
import Social from "./social"
import ProductSearch from "./Clothes";
import GetTheNews from "./news";

export default function Main() {
  return (
    <div style={{ backgroundColor: '#303030' }}>
        <ToolBar />
        <Presentation />
        {/*<ProductSearch></ProductSearch>*/}
        <GetTheNews></GetTheNews>
        <Social />
        {/* <Slide/> */}
        {/* <SetShopList/> */}
    </div>
  );
}
