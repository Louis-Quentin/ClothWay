import MenuIcon from '@mui/icons-material/Menu'
import { useState } from 'react'
import {
    ExpandLess,
    ExpandMore,
    Checkroom
} from '@mui/icons-material'
import {
    IconButton,
    Drawer,
    Box,
    List,
    ListItemButton,
    ListItemIcon,
    ListItemText,
    Collapse
} from '@mui/material'

export default function DrawerMenu() {
    const [isDrawerOpen, setIsDrawerOpen] = useState(false)
    const [open, setOpen] = useState(false)
    const [types, setTypes] = useState([
        {
            name: 'Vêtements',
            isOpen: false,
            icon: 'Checkroom',
            collapses: [
                {
                    name: 'T-shirts',
                    redirection: '/'
                },
                {
                    name: 'Vestes',
                    redirection: '/'
                }
            ]
        },
        {
            name: 'Accesoires',
            isOpen: false,
            icon: 'Checkroom',
            collapses: [
                {
                    name: 'Casquettes',
                    redirection: '/'
                },
                {
                    name: 'Bijoux',
                    redirection: '/'
                }
            ]
        }
    ])

    const handleClick = (type) => {
        setOpen(!open)
        type.isOpen = !type.isOpen
    }

    const chooseIcon = (icon) => {
        console.log(icon)
        if (icon === 'Checkroom') {
            return (<Checkroom/>)
        }
    }

    return (
        <>
            <IconButton
                size="large"
                edge="start"
                color="inherit"
                arial-label="menu"
                sx={{mr: 2}}
                onClick={() => setIsDrawerOpen(true)}>
                <MenuIcon/>
            </IconButton>
            <Drawer
                anchor="left"
                open={ isDrawerOpen }
                onClose={() => setIsDrawerOpen(false)}
                PaperProps={{
                    sx: { width: '15%' },
                  }}>
                <List sx={{ width: '100%', bgcolor: 'background.paper' }}>
                    {types.map(type => {
                        return (
                            <>
                                <ListItemButton onClick={() => handleClick(type)}>
                                    {/* <ListItemIcon>
                                        {chooseIcon(type.icon)}
                                    </ListItemIcon> */}
                                    <ListItemText primary={type.name} />
                                    {type.isOpen ? <ExpandLess/> : <ExpandMore/>}
                                </ListItemButton>
                                {type.collapses.map(collapse => {
                                    return (
                                        <>
                                            <Collapse in={type.isOpen} timeout="auto" unmountOnExit>
                                                <List component="div" disablePadding>
                                                    <ListItemButton sx={{ pl: 4 }} href={collapse.redirection}>
                                                        <ListItemText primary={collapse.name}/>
                                                    </ListItemButton>
                                                </List>
                                            </Collapse>
                                        </>
                                    )
                                })}
                            </>
                        )
                    })}
                </List>
            </Drawer>
        </>
    )
}