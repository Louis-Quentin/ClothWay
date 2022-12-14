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
    Stack,
    Drawer,
    Box
}
    from '@mui/material';
import { useState } from 'react'

const Search = styled('div')(({theme}) => ({
    position: 'relative',
    borderRadius: theme.shape.borderRadius,
    backgroundColor: alpha(theme.palette.common.white, 0.15),
    '&:hover': {
        backgroundColor: alpha(theme.palette.common.white, 0.25),
    },
    marginLeft: 0,
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

export default function Main() {
    const [isDrawerOpen, setIsDrawerOpen] = useState(false)
    return (
        <div>
            <AppBar elevation={0} position='static' style={{background: '#303030'}}>
                <Toolbar sx={{justifyContent: "space-between"}}>
                    <Stack direction="row" alignItems="center">
                        <IconButton
                            size="large"
                            edge="start"
                            color="inherit"
                            arial-label="menu"
                            sx={{mr: 2}}
                            onClick={() => setIsDrawerOpen(true)}
                        >
                            <MenuIcon/>
                        </IconButton>
                        <Drawer
                            anchor="left"
                            open={ isDrawerOpen }
                            onClose={() => setIsDrawerOpen(false)}>
                            <Box>
                                <Typography>
                                    Side Panel
                                </Typography>
                            </Box>
                        </Drawer>
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
                    <Button href="/register" sx={{color: "inherit"}}> S'inscrire </Button>
                </Toolbar>
            </AppBar>
        </div>
    );
}
