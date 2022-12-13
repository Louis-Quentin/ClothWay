import * as React from 'react';
import MenuIcon from '@mui/icons-material/Menu';
import SearchIcon from '@mui/icons-material/Search';
import {
    AppBar,
    Toolbar,
    IconButton,
    Typography,
    Button,
    styled,
    alpha,
    InputBase,
    Stack
<<<<<<< HEAD:sources/web-front/src/pages/main_page/ToolBar.js
  } from '@mui/material';

const Search = styled('div')(({ theme }) => ({
  position: 'relative',
  borderRadius: theme.shape.borderRadius,
  backgroundColor: alpha(theme.palette.common.white, 0.20),
  '&:hover': {
    backgroundColor: alpha(theme.palette.common.white, 0.30),
  },
  marginLeft: 0,
  width: '100%',
  [theme.breakpoints.up('sm')]: {
    marginLeft: theme.spacing(1),
    width: 'auto',
  },
}));

const SearchIconWrapper = styled('div')(({ theme }) => ({
  padding: theme.spacing(0, 2),
  height: '100%',
  position: 'absolute',
  pointerEvents: 'none',
  display: 'flex',
  alignItems: 'center',
  justifyContent: 'center',
}));

const StyledInputBase = styled(InputBase)(({ theme }) => ({
  color: 'inherit',
  '& .MuiInputBase-input': {
    padding: theme.spacing(1, 1, 1, 0),
    // vertical padding + font size from searchIcon
    paddingLeft: `calc(1em + ${theme.spacing(4)})`,
    transition: theme.transitions.create('width'),
=======
}
    from '@mui/material';
import SetShopList from "./Main_page_components/ShopList";

const Search = styled('div')(({theme}) => ({
    position: 'relative',
    borderRadius: theme.shape.borderRadius,
    backgroundColor: alpha(theme.palette.common.white, 0.15),
    '&:hover': {
        backgroundColor: alpha(theme.palette.common.white, 0.25),
    },
    marginLeft: 0,
>>>>>>> BackEnd:sources/web-front/src/pages/Main.js
    width: '100%',
    [theme.breakpoints.up('sm')]: {
        marginLeft: theme.spacing(1),
        width: 'auto',
    },
}));

const SearchIconWrapper = styled('div')(({theme}) => ({
    padding: theme.spacing(0, 2),
    height: '100%',
    position: 'absolute',
    pointerEvents: 'none',
    display: 'flex',
    alignItems: 'center',
    justifyContent: 'center',
}));

const StyledInputBase = styled(InputBase)(({theme}) => ({
    color: 'inherit',
    '& .MuiInputBase-input': {
        padding: theme.spacing(1, 1, 1, 0),
        // vertical padding + font size from searchIcon
        paddingLeft: `calc(1em + ${theme.spacing(4)})`,
        transition: theme.transitions.create('width'),
        width: '100%',
        [theme.breakpoints.up('sm')]: {
            width: '12ch',
            '&:focus': {
                width: '20ch',
            },
        },
    },
}));

<<<<<<< HEAD:sources/web-front/src/pages/main_page/ToolBar.js
export default function ToolBar() {
  return (
    <AppBar
      position='static'
      style={{ background: '#27D18A' }}
      elevation={0}>
      <Toolbar sx={{ justifyContent: "space-between" }}>
        <Stack direction="row" alignItems="center">
          <IconButton
            size="large"
            edge="start"
            color="inherit"
            arial-label="menu"
            sx={{ mr: 2 }}
          >
            <MenuIcon />
          </IconButton>
          <Typography
            variant="h6"
            component="div"
            sx={{ mr: 10 }}>
            ClothWay
          </Typography>
        </Stack>
        <Search>
          <SearchIconWrapper>
            <SearchIcon />
          </SearchIconWrapper>
          <StyledInputBase
            placeholder="Recherche…"
            inputProps={{ 'aria-label': 'search' }}
          />
        </Search>
        <Button
          href="/register"
          sx={{ color: "inherit" }}>
          Se connecter
        </Button>
      </Toolbar>
    </AppBar>
  );
=======
export default function Main() {
    return (
        <div>
            <AppBar position='static' style={{background: 'green'}}>
                <Toolbar sx={{justifyContent: "space-between"}}>
                    <Stack direction="row" alignItems="center">
                        <IconButton
                            size="large"
                            edge="start"
                            color="inherit"
                            arial-label="menu"
                            sx={{mr: 2}}
                        >
                            <MenuIcon/>
                        </IconButton>
                        <Typography variant="h6" component="div" sx={{mr: 10}}>
                            ClothWay
                        </Typography>
                    </Stack>
                    <Search>
                        <SearchIconWrapper>
                            <SearchIcon/>
                        </SearchIconWrapper>
                        <StyledInputBase
                            placeholder="Recherche…"
                            inputProps={{'aria-label': 'search'}}
                        />
                    </Search>
                    <Button href="/test" sx={{color: "inherit"}}> S'inscrire </Button>
                </Toolbar>
            </AppBar>
            <SetShopList>
            </SetShopList>
        </div>
    );
>>>>>>> BackEnd:sources/web-front/src/pages/Main.js
}
