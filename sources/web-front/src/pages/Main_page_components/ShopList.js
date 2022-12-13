import {ItemToSell} from "./ItemToSell"
import {StyleItemCard} from "./ItemsStyle/StyleItemCard.css"
import {StyleItemImg} from "./ItemsStyle/StyleItemPrice.css"
import {styleProducts_list} from "./ItemsStyle/ProductStyle.css"

export default function SetShopList() {
    let parsed_data = [new ItemToSell(23, 5), new ItemToSell(15, 3), new ItemToSell(6, 1)]
    let items_list = [];
    parsed_data.forEach(function (elem) {
        let ItemToSell = {};
        ItemToSell["Score"] = elem.score
        ItemToSell["Price"] = elem.Price
        ItemToSell["Img"] = document.createElement('img');
        ItemToSell["Img"].src = "https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/966d8f2a-dd27-4b55-b66f-9e80043fc67d/chaussure-de-running-sur-route-quest-5-pour-R8wtjM.png"
        //document.body.appendChild(ItemToSell["Img"])
        items_list.push(ItemToSell)
    });
    /*turn DisplayItem
        for (var i = 0; i < items_list.length; i += 1) {
            <DisplayItem ItemToSell={items_list[i]}/>
        }
)*/ 
}

function DisplayItemImg() {
    return (
        <div className="style-item-img">Img</div>
    )
}

function DisplayItemPrice() {
    return (
        <div className="style-item-price">Price</div>
    )
}

function DisplayItemScore() {
    return (
        <div className="style-item-score" onClick={DisplayDetailedScore}>Éco-Score</div>
    )
}

function DisplayDetailedScore() {
    return (
        <div></div>
    )
}

export const DisplayItem = ({ItemToSell}) => {
    return (
        <div className="style-item-card">
            <DisplayItemImg img={ItemToSell.Img}/>
            <DisplayItemPrice price={ItemToSell.Price}/>
            <DisplayItemScore score={ItemToSell.Score}/>
        </div>
    )
}