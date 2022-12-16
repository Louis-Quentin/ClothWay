import {ItemToSell} from "./ItemToSell"
import {useState} from "react"
import {StyleItemCard} from "./ItemsStyle/StyleItemCard.css"
import {StyleItemImg} from "./ItemsStyle/StyleItemPrice.css"
import {styleProducts_list} from "./ItemsStyle/ProductStyle.css"
import {styleItemCategory} from "./ItemsStyle/StyleItemCategory.css"
import {styleItemScore} from "./ItemsStyle/StyleItemScore.css"
import CustomizedRating from "./ScoreComponent";
import {Button} from "@mui/material";

function httpGet(theUrl)
{
    var xmlHttp = new XMLHttpRequest();
    xmlHttp.open( "GET", theUrl, false ); // false for synchronous request
    xmlHttp.send( null );
    return xmlHttp.responseText;
}
export default function SetShopList() {
    let stored_shop_list = JSON.parse(httpGet("http://localhost:8080/get_all_cloths"))
    console.log("STORED_LIST_PLS", stored_shop_list)
    //let parsed_data = [new ItemToSell(23, 5), new ItemToSell(15, 3.7), new ItemToSell(6, 1), new ItemToSell(9.99, 1), new ItemToSell(6, 1.7), new ItemToSell(6, 4.8), new ItemToSell(6, 4)]
    let items_list = [];
    Object.entries(stored_shop_list).forEach((elem) => {
        const [key, value] = elem;
        Object.entries(value).forEach((row) => {
            const [k, v] = row
            let ItemToSell = {};
            ItemToSell["Score"] = v.Score
            ItemToSell["Price"] = v.Price
            ItemToSell["Img"] = document.createElement('img');
            if (v.Picture.includes("pantalon_2") === true) {
                ItemToSell["Img"].src = "data:image/jpeg;base64,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" //../../../chemise1.jpg"
            } else if (v.Picture.includes("chemise_1") === true) {
                ItemToSell["Img"].src = "data:image/jpeg;base64,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"
            } else if (v.Picture.includes("pull_1") === true) {
                ItemToSell["Img"].src = "data:image/jpeg;base64,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"
            } else if (v.Picture.includes("pantalon_1") === true) {
                ItemToSell["Img"].src = "data:image/jpeg;base64,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"
            } else if (v.Picture.includes("chaussures_1") === true) {
                ItemToSell["Img"].src = "data:image/jpeg;base64,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"
            }
            //ItemToSell["Img"].src = v.Picture
            //document.body.appendChild(ItemToSell["Img"])
            ItemToSell["Img"].width = 500
            ItemToSell["Img"].height = 500
            items_list.push(ItemToSell)
            console.log("PICTURE PATH", v.Picture)
        })
        //console.log("IN FOR LOOP", key, value)
    });
    /*for (const key in stored_shop_list) {
        let ItemToSell = {};
        ItemToSell["Score"] = elem.Score
        ItemToSell["Price"] = elem.Price
        ItemToSell["Img"] = document.createElement('img');
        ItemToSell["Img"].src = elem.Picture
        //document.body.appendChild(ItemToSell["Img"])
        ItemToSell["Img"].width = 500
        ItemToSell["Img"].height = 500
        items_list.push(ItemToSell)
    });*/
    console.log("LIST",items_list)
    items_list.map((row) => console.log("in list", row.Price));
    return (
        <div className="style-products_list">
            {
                items_list.map((item, key) => <DisplayItem key={key} item={item}/>)
            }
        </div>
    )

}
//https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/f06f9381-79d1-4e3b-bad3-bc2e45ae0863/chaussure-jordan-jumpman-pro-pour-j5vqXB.png
function DisplayItemImg(props) {
    return (
        <div className="style-item-img"><img
            src={props.img.src}
            width={props.img.width}
            height={props.img.height}
            /></div>
    )
}

function DisplayItemPrice(props) {
    return (
        <div className="style-item-price-box">
            <div className="style-item-price">{props.price}</div>
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

export const DisplayItem = (props) => {
    console.log("DISPLAY ITEM", props.item)
    //const {key, children, ..._} = item;
    //console.log(key, children);
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
            <DisplayItemImg img={props.item.Img}/>
            <DisplayItemCategory category={props.Price}/>
            <DisplayItemPrice price={props.item.Price}/>
            <Button className="style-item-score-button" style={{
                display: "inline-block",
                width: "150px",
                marginLeft: "1Opx"
            }} onClick={DisplayDetailedScore}>
                {items}
                <CustomizedRating score={props.item.Score}/>
            </Button>
        </div>
    )
}