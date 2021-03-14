import React from "react";
import PropTypes from "prop-types";
import DialogTitle from "@material-ui/core/DialogTitle";
import Dialog from "@material-ui/core/Dialog";
import List from "@material-ui/core/List";
import ListItem from "@material-ui/core/ListItem";
import ListItemAvatar from "@material-ui/core/ListItemAvatar";
import Avatar from "@material-ui/core/Avatar";
import {Airplay, Refresh} from "@material-ui/icons";
import ListItemText from "@material-ui/core/ListItemText";
import {CastContext} from "../../Contexts";
import {DialogContentText, IconButton, Toolbar} from "@material-ui/core";
import DialogContent from "@material-ui/core/DialogContent";


const CastDialog = ({onCancel, onSelect, open}) => {
    const [devices, setDevices] = React.useState([]);
    const Cast = React.useContext(CastContext);
    const UpdateDevices = () => Cast.info.getPeerDevices().then(d => {
        console.log(d);
        return d
    }).then(setDevices);
    React.useEffect(() => {
        UpdateDevices();
    }, []);
    return (
        <Dialog onClose={onCancel} aria-labelledby="simple-dialog-title" open={open}>
            <DialogTitle id="simple-dialog-title">
                <Toolbar className={"p-0 m-0"}>
                    <ListItemText primary={<div className={"text-truncate"}>Select Cast Device</div>}
                                  secondary={"Select Device to Cast to"}/>
                    <div style={{flex: "1 1 auto"}}/>
                    <IconButton className={"ml-1"} onClick={UpdateDevices}><Refresh/></IconButton>
                </Toolbar>
            </DialogTitle>
            <List>
                {devices && devices.length ? devices.map((id, index) => (
                    <ListItem button onClick={() => onSelect(id)} key={index}>
                        <ListItemAvatar>
                            <Avatar>
                                <Airplay/>
                            </Avatar>
                        </ListItemAvatar>
                        <ListItemText primary={id}/>
                    </ListItem>
                )) : <div>
                    <DialogContent><DialogContentText><ListItemText
                        primary={"Refresh Other devices and they will magically appear here"}/></DialogContentText></DialogContent>
                </div>}
            </List>
        </Dialog>);
};

CastDialog.propTypes = {
    onCancel: PropTypes.func.isRequired,
    open: PropTypes.bool.isRequired,
    onSelect: PropTypes.string.isRequired,
};
export default CastDialog;
