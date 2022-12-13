import * as React from 'react';
import ToolBar from "./ToolBar";
import Presentation from "./Presentation";
import SetShopList from "../Main_page_components/ShopList"

export default function Main() {
  return (
    <div>
        <ToolBar />
        <Presentation />
        <SetShopList/>
    </div>
  );
}
