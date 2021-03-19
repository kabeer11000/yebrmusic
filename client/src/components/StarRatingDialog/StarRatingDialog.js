import React from 'react';
import './StarRatingDialog.css';
import DialogContent from "@material-ui/core/DialogContent";
import Dialog from "@material-ui/core/Dialog";
import DialogTitle from "@material-ui/core/DialogTitle";
import Rating from "./Rating";

const StarRatingDialog = ({title, id, open, onClose}) => (
    <div className="StarRatingDialog">
        <Dialog open={open} onClose={onClose}>
            <DialogTitle id="simple-dialog-title">Rate {title}</DialogTitle>
            <DialogContent>
                <Rating rating={0}/>
            </DialogContent>
        </Dialog>
    </div>
);

StarRatingDialog.propTypes = {};

StarRatingDialog.defaultProps = {};

export default StarRatingDialog;
