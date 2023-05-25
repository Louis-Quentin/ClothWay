import React, { useState, useEffect } from "react";
import "./GetTheNews.css";

import {
    AppBar,
    Toolbar,
    Typography,
    Button,
    Stack,
} from '@mui/material'

export default function GetTheNews() {
  const [news, setNews] = useState([]);
  const randomNews = Math.floor(Math.random() * news.length);

  useEffect(() => {
    fetch("https://newsapi.org/v2/top-headlines?country=fr&category=science&apiKey=39dba7bee8ee4f0ab6a4d81208177c81")
      .then((response) => response.json())
      .then((data) => setNews(data.articles))
      .catch((error) => console.log(error));
  }, []);

  return (
    <div className="news-banner">
    <Button href="/" sx={{color: "inherit"}}>
        Nouvelle Actu
    </Button>
      {news.length > 0 ? (
        <>
          <h1 className="news-title">{news[randomNews].title}</h1>
          <p className="news-description">{news[randomNews].description}</p>
          <a href={news[randomNews].url} target="_blank" rel="noopener noreferrer">Lire la suite sur {news[randomNews].source.name}</a>
        </>
      ) : (
        <p>Chargement des actualités...</p>
      )}
    </div>
  );
}

