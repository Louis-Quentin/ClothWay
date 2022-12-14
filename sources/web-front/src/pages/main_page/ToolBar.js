import SearchBar from "./SearchBar";
import DrawerMenu from "./DrawerMenu";
import {
    AppBar,
    Toolbar,
    Typography,
    Button,
    Stack,
} from '@mui/material';

export default function Main() {
    return (
        <AppBar elevation={0} position='static' style={{background: '#303030'}}>
            <Toolbar sx={{justifyContent: "space-between"}}>
                <Stack direction="row" alignItems="center">
                    <DrawerMenu/>
                    <Typography variant="h6" component="div" sx={{mr: 10}}>
                        ClothWay
                    </Typography>
                </Stack>
                <SearchBar/>
                <Button href="/register" sx={{color: "inherit"}}>
                    Se connecter
                </Button>
            </Toolbar>
        </AppBar>
    );
}
