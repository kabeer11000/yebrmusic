import React from "react";
import PropTypes from "prop-types";
import {makeStyles} from "@material-ui/core/styles";
import Avatar from "@material-ui/core/Avatar";
import List from "@material-ui/core/List";
import ListItem from "@material-ui/core/ListItem";
import ListItemAvatar from "@material-ui/core/ListItemAvatar";
import ListItemText from "@material-ui/core/ListItemText";
import DialogTitle from "@material-ui/core/DialogTitle";
import Dialog from "@material-ui/core/Dialog";
import {Airplay} from "@material-ui/icons";
import {blue} from "@material-ui/core/colors";

const useStyles = makeStyles({
	avatar: {
		backgroundColor: blue[100],
		color: blue[600],
	},
});

export default function CastDialog(props) {
	const classes = useStyles();
	const {onClose, selectedValue, open, emails} = props;

	const handleClose = () => {
		onClose();
	};

	const handleListItemClick = (value) => {
		onClose(value);
	};

	return (
		<Dialog onClose={handleClose} aria-labelledby="simple-dialog-title" open={open}>
			<DialogTitle id="simple-dialog-title">Select Cast Device</DialogTitle>
			<List>
				{emails.map((email) => (
					<ListItem button onClick={() => handleListItemClick(email)} key={email}>
						<ListItemAvatar>
							<Avatar>
								<Airplay/>
							</Avatar>
						</ListItemAvatar>
						<ListItemText primary={email}/>
					</ListItem>
				))}
			</List>
		</Dialog>
	);
}

CastDialog.propTypes = {
	onClose: PropTypes.func.isRequired,
	open: PropTypes.bool.isRequired,
	selectedValue: PropTypes.string.isRequired,
	emails: PropTypes.array.isRequired
};
