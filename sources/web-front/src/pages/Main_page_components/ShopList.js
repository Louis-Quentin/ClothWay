import {ItemToSell} from "./ItemToSell"
import {useState} from "react"
import {StyleItemCard} from "./ItemsStyle/StyleItemCard.css"
import {StyleItemImg} from "./ItemsStyle/StyleItemPrice.css"
import {styleProducts_list} from "./ItemsStyle/ProductStyle.css"
import {styleItemCategory} from "./ItemsStyle/StyleItemCategory.css"
import {styleItemScore} from "./ItemsStyle/StyleItemScore.css"
import CustomizedRating from "./ScoreComponent";
import {Button} from "@mui/material";

/*function httpGet(theUrl)
{
    var xmlHttp = new XMLHttpRequest();
    xmlHttp.open( "GET", theUrl, false ); // false for synchronous request
    xmlHttp.send( null );
    return xmlHttp.responseText;
}*/
export default function SetShopList() {
    //let stored_shop_list = httpGet("http://localhost:8080/get_all_cloths")
    //console.log("STORED_LIST_PLS", stored_shop_list)
    const options = {
        method: "GET",
        body: "",
        Headers: {
            "Content-Type": "application/json"
        }
    };
    fetch("http://localhost:8080/get_all_cloths", options)
        .then(response =>
        {
            console.log("GET ALL CLOTHS OK LE BACK A RENVOYER LA RÉPONSE");
            //response.json()
            console.log(response.json())
        })
        .then(inputs => {
            console.log(inputs)
            console.log("GET ALL CLOTHS OK LE BACK A RENVOYER LA RÉPONSE");
        })
        .catch(error => {
            //handle errors
        });
    let parsed_data = [new ItemToSell(23, 5), new ItemToSell(15, 3.7), new ItemToSell(6, 1), new ItemToSell(9.99, 1), new ItemToSell(6, 1.7), new ItemToSell(6, 4.8), new ItemToSell(6, 4)]
    let items_list = [];
    parsed_data.forEach(function (elem) {
        let ItemToSell = {};
        ItemToSell["Score"] = elem.Score
        ItemToSell["Price"] = elem.Price
        ItemToSell["Img"] = document.createElement('img');
        ItemToSell["Img"].src = "https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/966d8f2a-dd27-4b55-b66f-9e80043fc67d/chaussure-de-running-sur-route-quest-5-pour-R8wtjM.png"
        //document.body.appendChild(ItemToSell["Img"])
        ItemToSell["Img"].width = 500
        ItemToSell["Img"].height = 500
        items_list.push(ItemToSell)
    });
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