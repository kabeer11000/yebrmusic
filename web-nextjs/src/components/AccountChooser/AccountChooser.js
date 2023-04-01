import React from "react";
import "./AccountChooser.css";
import Drawer from "@material-ui/core/Drawer";
import ListItem from "@material-ui/core/ListItem";
import ListItemAvatar from "@material-ui/core/ListItemAvatar";
import ListItemText from "@material-ui/core/ListItemText";
import ListItemSecondaryAction from "@material-ui/core/ListItemSecondaryAction";
import List from "@material-ui/core/List";
import Container from "@material-ui/core/Container";
import {Avatar, Divider} from "@material-ui/core";
import {Add, Contacts, VerifiedUser} from "@material-ui/icons";
import {AccountChooserContext, AccountContext} from "../../Contexts";
import {Cookies} from "../../functions/Cookies";
import {storageIndex} from "../../functions/Helper/StorageIndex";
import CircularProgress from "@material-ui/core/CircularProgress";
import Typography from "@material-ui/core/Typography";

export const ImageLinks = {
	KABEERS_NETWORK_LOGO: "https://cdn.jsdelivr.net/gh/kabeer11000/docs-hosted@kabeersauth-assets/assets/images/consent/kabeers-network-logo.svg"
};
const AccountChooser = () => {
	const {account} = React.useContext(AccountContext);
	const {sessions, dialog} = React.useContext(AccountChooserContext);
	const [accounts] = sessions;
	const [open, setOpen] = dialog;

	return (
		<Drawer
			variant="temporary"
			anchor={"bottom"}
			PaperProps={{
				component: Container,
				maxWidth: "sm",
				className: "px-0",
				square: false,
				style: {
					borderRadius: "0.4rem 0.4rem 0 0"
				}
			}}
			onClose={() => setOpen(false)}
			ModalProps={{keepMounted: true}}
			open={open}>
			<List>
                <ListItem>
                    <ListItemAvatar>
                        <Avatar src={ImageLinks.KABEERS_NETWORK_LOGO}/>
                    </ListItemAvatar>
                    <ListItemText primary={"Kabeers Network"} secondary={<>Switch Account <VerifiedUser style={{
                        marginLeft: "0.5rem",
                        width: "1rem",
                        height: "1rem",
                    }}/></>}/>
                </ListItem>
                <Divider/>
				{
					accounts.all ? accounts.all.map((a, index) => (
						<React.Fragment key={index}>
							<ListItem disabled={!a.signed_in || account?.user_id === a.user_id}
                                      selected={account?.user_id === a.user_id}
                                      style={{minWidth: "100%"}} button alignItems="flex-start"
                                      onClick={async () => {
										  setOpen(!open);
										  const params = new URLSearchParams(window.location.search);
										  params.set("u", index);
										  Cookies.deleteCookie(storageIndex.cookies.ServiceLoginToken);
										  window.location.search = params.toString();
										  // window.location.href = window.location.href + "?u=" + index
										  // await functions.SignIn(index);
									  }}>
								<ListItemAvatar>
									<Avatar alt={a.username} src={a.account_image}/>
								</ListItemAvatar>
								<ListItemText
									primary={<div className={"text-truncate"}>{a.username}</div>}
									secondary={<div className={"text-truncate"}>{a.email}</div>}
								/>
								<ListItemSecondaryAction style={{
									paddingBottom: "1.2rem"
								}}>
									{!a.signed_in && <ListItemText secondary={"Signed Out"}/>}
								</ListItemSecondaryAction>
							</ListItem>
						</React.Fragment>
					)) : null
				}
				{accounts.offline &&
				<div className={"text-center d-flex justify-content-center"}><CircularProgress/></div>}
				<Divider variant="fullWidth"/>
				<ListItem button
						  onClick={() => window.location.href = "LOGIN" + "?prompt=password"}>
					<ListItemAvatar><Add/></ListItemAvatar>
					<ListItemText primary={<Typography variant={"button"}>Add New Account</Typography>}/>
				</ListItem>
			</List>
		</Drawer>
	);
};

AccountChooser.propTypes = {};

AccountChooser.defaultProps = {};

export default AccountChooser;
