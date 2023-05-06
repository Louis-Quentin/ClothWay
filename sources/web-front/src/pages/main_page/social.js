import IconButton from '@mui/material/IconButton';
import InstagramIcon from '@mui/icons-material/Instagram';
import TwitterIcon from '@mui/icons-material/Twitter';
import PhoneIcon from '@mui/icons-material/Phone';
import EmailIcon from '@mui/icons-material/Email';
import AppBar from '@mui/material/AppBar';
import Toolbar from '@mui/material/Toolbar';

export default function Social() {
  return (
    <AppBar elevation={0} position='static' style={{background: '#303030'}}>
      <Toolbar sx={{ justifyContent: "space-between", height: "200px"}}>
        <div sx={{ display: "flex", alignItems: "center" }}>
          <IconButton
            aria-label="phone"
            component="a"
            href="tel:123-456-7890"
            target="_blank"
            rel="noopener"
            sx={{ color: "#fff" }}
          >
            <PhoneIcon />
          </IconButton>
          <p style={{ color: "#fff", margin: 0, ml: "10px" }}>123-456-7890</p>
        </div>
        <div sx={{ display: "flex", alignItems: "center" }}>
          <IconButton
            aria-label="email"
            component="a"
            href="mailto:example@example.com"
            target="_blank"
            rel="noopener"
            sx={{ color: "#fff" }}
          >
            <EmailIcon />
          </IconButton>
          <p style={{ color: "#fff", margin: 0, ml: "10px" }}>ClothwayClothway@gmail.com</p>
        </div>
        <div sx={{ display: "flex", alignItems: "center" }}>
          <IconButton
            aria-label="instagram"
            component="a"
            href="https://www.instagram.com/clothwayclothway"
            target="_blank"
            rel="noopener"
            sx={{ color: "#fff" }}
          >
            <InstagramIcon />
          </IconButton>
        </div>
        <div sx={{ display: "flex", alignItems: "center" }}>
          <IconButton
            aria-label="twitter"
            component="a"
            href="https://www.twitter.com/_clothway_"
            target="_blank"
            rel="noopener"
            sx={{ color: "#fff" }}
          >
            <TwitterIcon />
          </IconButton>
        </div>
      </Toolbar>
    </AppBar>
  );
}
