import React, { Component } from "react";
import presentation from '../../images/presentation.jpg';
import animal from '../../images/animal.jpg';
import grow from '../../images/grow.jpg';
import lgbt from '../../images/lgbt.jpg';
import pannelcity from '../../images/pannelcity.jpg';
import solarypannel from '../../images/solarypannel.jpg';
import vignes from '../../images/vignes.jpg';
import Slider from "react-slick"
import "slick-carousel/slick/slick.css"; 
import "slick-carousel/slick/slick-theme.css";
import Arrows from "react-slick"
import dots from "../main_page/dots.css"

export default function Slide() {
  const settings = {
    dots: true,
    infinite: true,
    autoplay: true,
    autoplaySpeed: 1500,
    cssEase: "linear",
    speed: 400,
    slidesToShow: 1,
    slidesToScroll: 1,
  };
  return (
    <div>
      <div className="title">
      <h1> Actualités</h1>
      </div>
      <Slider {...settings}>
     
      <div className="container">
      <img
          src={ grow }
          alt="presentation"
      />
      </div>
      <div className="container">
      <img
          src={ animal }
          alt="presentation"
      />
      </div>
      <div className="container">
      <img
          src={ lgbt }
          alt="presentation"
      />
      </div>
      <div className="container">
      <img
          src={ pannelcity }
          alt="presentation"
      />
          </div>
          <div className="container">
      <img
          src={ solarypannel }
          alt="presentation"
      />
          </div>
          <div className="container">
      <img
          src={ vignes }
          alt="presentation"
      />
          </div>
          <div className="container">
      <img
          src={ animal }
          alt="presentation"
      />
          </div>
      </Slider>
    </div>
  );
}