import SearchBar from "./SearchBar"
import DrawerMenu from "./DrawerMenu"
import {
    AppBar,
    Toolbar,
    Typography,
    Button,
    Stack,
} from '@mui/material'

function MyButton({ Text, Href, Size }) {
    return (
        <Button href={ Href } color='inherit' style={{textTransform: 'none'}}>
            <Typography variant={ Size }>
                { Text }
            </Typography>
        </Button>
    );
}
export default function ToolBar() {
    return (
      <AppBar elevation={0} position='static' style={{background: '#303030'}}>
        <Toolbar sx={{justifyContent: "space-between"}}>
          <Stack direction="row" alignItems="center">
            <DrawerMenu/>
            <MyButton Text="ClothWay" Href="/" Size="h4"/>
          </Stack>
          <div style={{ position: 'absolute', right: '500px' }}>
          <Button href="/news" sx={{color: "inherit"}}>
            Actualités
          </Button>
          </div>
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
  
  
  
  
  
  
  
