import React, { useState, useLayoutEffect } from 'react';
import HomeIcon from '@mui/icons-material/Home';

const Privacy = () => {
    useLayoutEffect(() => {
        document.body.style.backgroundColor = '#303030';
      });    
  const privacyPolicyText = `
    Politique de confidentialité
    
    Chez clothway, nous attachons une grande importance à la protection de votre vie privée et à la sécurité de vos informations personnelles. 
    Cette politique de confidentialité décrit comment nous collectons, 
    utilisons et protégeons les informations que vous nous fournissez lorsque vous utilisez notre site web pour acheter des vêtements éco responsables. 
    Veuillez lire attentivement cette politique pour comprendre nos pratiques en matière de confidentialité.
    Si vous avez des questions ou des préoccupations concernant notre politique de confidentialité, veuillez nous contacter à ClothwayClothway@gmail.com.
    
    Dernière mise à jour : Mai 2023
  `;

  const style = {
    color: '#fff',
    padding: '20px',
    fontSize: '20px'
  };

  return (
    <div style={style}>
      <h1 style={{ color: '#fff' }}>Politique de confidentialité</h1>
      <pre>{privacyPolicyText}</pre>
      <div className="home-container">
      <a
        href="/"
        target="_blank"
        rel="noopener"
        className="home-link"
      >
        <HomeIcon sx={{ color: '#fff' }} />
      </a>
    </div>
    </div>
  );
};

export default Privacy;
