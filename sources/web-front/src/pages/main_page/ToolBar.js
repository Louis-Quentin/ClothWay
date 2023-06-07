import SearchBar from "./SearchBar"
import DrawerMenu from "./DrawerMenu"
import LogoClothWay from '../../images/logo_clothway.png'
import {
    AppBar,
    Toolbar,
    Typography,
    Button,
    Stack,
    Tooltip,
} from '@mui/material'

export default function ToolBar() {
    const clothes = [
        {name: "Tshirts", href: "/clothes"},
        {name: "Pantalons", href: "/clothes"},
        {name: "Chaussures", href: "/clothes"},
        {name: "Autre", href: "/clothes"},
    ];

    return (
      <AppBar elevation={0} position='static' style={{background: '#303030'}}>
        <Toolbar sx={{justifyContent: "space-between"}}>
          <Stack direction="row" alignItems="center">
            <DrawerMenu/>
            <a href='/'>
              <img width='40%' src={LogoClothWay} alt='ClothWay' href='/'/>
            </a>
          </Stack>
          <div style={{ position: 'absolute', right: '300px' }}>
          <Button href="/register_partner" sx={{color: "inherit"}}>
            Se connecter entreprise
          </Button>
          </div>
          {/* <div style={{ position: 'absolute', right: '1350px' }}>
            <Tooltip title={
                <Stack>
                    {clothes.map((item, index) => (
                        <Button key={index} href={item.href} sx={{color: "inherit"}}>
                            {item.name}
                        </Button>
                    ))}
                </Stack>
            }>
              <Button sx={{color: "inherit"}}>
                Produits
              </Button>
            </Tooltip>
          </div> */}
          <div style={{ position: 'absolute', right: '900px' }}>
            <SearchBar/>
          </div>
          <Button href="/register" sx={{color: "inherit"}}>
            Se connecter
          </Button>
        </Toolbar>
      </AppBar>
    );
  }
