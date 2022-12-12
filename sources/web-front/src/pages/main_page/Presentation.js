import * as React from 'react';
import presentation from '../../images/presentation.jpg';

export default function Presentation() {
    const imgStyle = {
        width: "95%",
        objectFit: 'cover',
        display: 'block',
        marginLeft: 'auto',
        marginRight: 'auto',
        marginTop: '3%',
        blur: '0px'
    };
    return (
        <div>
            <img
                src={ presentation }
                alt="presentation"
                style={ imgStyle }
            />
            <div style={{
                color: 'white',
                position: 'absolute',
                left: '55%',
                top: '10%'
            }}>
                <h2>ClothWay, la mode écoresponsable</h2>
                <p>Laaaaaaaaaaaaa</p>
            </div>
        </div>
    );
  }