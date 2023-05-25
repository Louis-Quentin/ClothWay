import * as React from 'react';
import { styled } from '@mui/material/styles';
import Box from '@mui/material/Box';
import Rating from '@mui/material/Rating';
import FavoriteIcon from '@mui/icons-material/Favorite';
import FavoriteBorderIcon from '@mui/icons-material/FavoriteBorder';
import Typography from '@mui/material/Typography';
import EnergySavingsLeafIcon from '@mui/icons-material/EnergySavingsLeaf';

const StyledRating = styled(Rating)({
    '& .MuiRating-iconFilled': {
        color: '#2E8B57',
    },
    '& .MuiRating-iconHover': {
        color: '#ff3d47',
    },
});

export default function CustomizedRating(score) {
    return (
        <div className="style-item-score-box">
            <Box
                sx={{
                    '& > legend': { mt: 2 },
                }}
            >
                <StyledRating
                    defaultValue={score.score}
                    getLabelText={(value) => `${value} Heart${value !== 1 ? 's' : ''}`}
                    precision={0.5}
                    icon={<EnergySavingsLeafIcon fontSize="inherit" />}
                    emptyIcon={<EnergySavingsLeafIcon fontSize="inherit" />}
                    readOnly
                />
            </Box>
        </div>
    );
}