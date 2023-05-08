import ToolBar from "./ToolBar";
import Presentation from "./Presentation";
import SetShopList from "../Main_page_components/ShopList"
import Slide from "./Slide";
import Social from "./social"
import ProductSearch from "./Clothes";

export default function Main() {
  return (
    <div>
        <ToolBar />
        <Presentation />
        {/*<ProductSearch></ProductSearch>*/}
        <Social />
        {/* <Slide/> */}
        {/* <SetShopList/> */}
    </div>
  );
}
