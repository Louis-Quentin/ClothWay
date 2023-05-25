    import * as React from 'react';
import presentation from '../../images/presentation.jpg';

export default function Presentation() {
    const imgStyle = {
        width: "100%",
        objectFit: 'cover',
        display: 'block',
    };
    return (
        <div>
            <img
                src={ presentation }
                alt="presentation"
                style={ imgStyle }
            />
        </div>
    );
  }