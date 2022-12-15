import {ItemToSell} from "./ItemToSell"
import {useState} from "react"
import {StyleItemCard} from "./ItemsStyle/StyleItemCard.css"
import {StyleItemImg} from "./ItemsStyle/StyleItemPrice.css"
import {styleProducts_list} from "./ItemsStyle/ProductStyle.css"
import {styleItemCategory} from "./ItemsStyle/StyleItemCategory.css"
import {styleItemScore} from "./ItemsStyle/StyleItemScore.css"
import CustomizedRating from "./ScoreComponent";
import {Button} from "@mui/material";

export default function SetShopList() {
    let parsed_data = [new ItemToSell(23, 5), new ItemToSell(15, 3), new ItemToSell(6, 1), new ItemToSell(6, 1), new ItemToSell(6, 1), new ItemToSell(6, 1), new ItemToSell(6, 1)]
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
    console.log(items_list.length)
    /*const Rows = []
    for (var i = 0; i < items_list.length; i += 1) {
        Rows.push(<DisplayItem ItemToSell={items_list[i]}/>);
    }
    return (
        <div className="style-products_list">
            <DisplayItem>{Rows}</DisplayItem>
        </div>
    )*/
    return (
        <div className="style-products_list">
            {items_list.map((row, index) => <DisplayItem key={index}/>)}
        </div>
    )

}
//https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/f06f9381-79d1-4e3b-bad3-bc2e45ae0863/chaussure-jordan-jumpman-pro-pour-j5vqXB.png
function DisplayItemImg(img) {
    console.log(img)
    return (
        <div className="style-item-img"><img
            src="https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/f06f9381-79d1-4e3b-bad3-bc2e45ae0863/chaussure-jordan-jumpman-pro-pour-j5vqXB.png"
            width="500"
            height="500"
            /></div>
    )
}

function DisplayItemPrice(price) {
    return (
        <div className="style-item-price-box">
            <div className="style-item-price">26.99 €</div>
        </div>
    )
}

function DisplayItemScore() {
    return (
        <div className="style-item-score-box">
            <div className="style-item-score">3.5/5</div>
        </div>
    )
}

function DisplayItemCategory() {
    return (
        <div className="style-item-category-box">
            <div className="style-item-category">Jordan Jumpman Pro</div>
        </div>
    )
}

export const DisplayItem = (item) => {
    const [is_up, set_is_up] = useState(false)
    const [{items}, setItems] = useState({items: []})
    const DisplayDetailedScore = () => {
        if (is_up === true) {
            console.log("IS UP = TRUE")
            setItems({items: []})
            set_is_up(false)
        }
        else {
            console.log("IS UP = FALSE")
            items.push(<div key={items.length} className="style-item-detailed-score">Détail du score</div>);
            setItems({items: [...items]});
            set_is_up(true)

        }
    };
    return (
        <div className="style-item-card">
            <DisplayItemImg img={item.Img}/>
            <DisplayItemCategory category={item.Price}/>
            <DisplayItemPrice price={item.Price}/>
            <Button className="style-item-score-button" style={{
                display: "inline-block",
                width: "150px",
                marginLeft: "1Opx"
            }} onClick={DisplayDetailedScore}>
                {items}
                <CustomizedRating/>
            </Button>
        </div>
    )
}