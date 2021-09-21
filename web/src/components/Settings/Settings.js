import React from "react";
import "./Settings.css";
import ListItemText from "@material-ui/core/ListItemText";
import ListItemSecondaryAction from "@material-ui/core/ListItemSecondaryAction";
import Switch from "@material-ui/core/Switch";
import {ArrowBack, Brightness4, Cast, DataUsage, Keyboard, Storage} from "@material-ui/icons";
import List from "@material-ui/core/List";
import ListItem from "@material-ui/core/ListItem";
import ListItemIcon from "@material-ui/core/ListItemIcon";
import Avatar from "@material-ui/core/Avatar";
import Divider from "@material-ui/core/Divider";
import FeedbackButton from "../FeedBack/FeedBack";
import {storageIndex} from "../../functions/Helper/StorageIndex";
import {useDialog} from "muibox";
import TextField from "@material-ui/core/TextField";
import AppBar from "@material-ui/core/AppBar";
import {Toolbar} from "@material-ui/core";
import IconButton from "@material-ui/core/IconButton";
import {AccountContext, ThemeContext} from "../../Contexts";
import {Device} from "../../functions/Device";
import {useHistory} from "react-router-dom";
import {del} from "idb-keyval";

const Settings = () => {
	const [switches, setSwitches] = React.useState({
		darkmode: localStorage.getItem(storageIndex.darkMode) === null ? false : JSON.parse(localStorage.getItem(storageIndex.darkMode)),
		keyboard: localStorage.getItem(storageIndex.onScreenKeyboard) === null ? false : JSON.parse(localStorage.getItem(storageIndex.onScreenKeyboard)),
		casting: localStorage.getItem(storageIndex.castEnabled) === null ? false : JSON.parse(localStorage.getItem(storageIndex.castEnabled)),
		litemode: localStorage.getItem(storageIndex.litemode) === null ? false : JSON.parse(localStorage.getItem(storageIndex.litemode))
	});
	const history = useHistory();
	const dialog = useDialog();
	const handleSwitch = (key, value) => setSwitches({...switches, [key]: value});
	const [darkmode, setDarkmode] = React.useContext(ThemeContext);
	const {account: userInfo} = React.useContext(AccountContext);
	React.useEffect(() => {
		if (!userInfo) window.location.href = "/LOGIN?prompt=password";
	}, []);

	return (
		<div className="Settings">
			<List className={"mt-5 text-left"}>
				<div style={{display: "inline-flex", justifyContent: "center"}} className={"w-100 mt-5"}>
					<IconButton>
						{userInfo ? <Avatar style={{
                            width: "4rem",
                            height: "4rem"
                        }} alt={userInfo.username} src={userInfo.account_image}/> : null}
					</IconButton>
				</div>
				{/*<CustomAppBar title={"Settings"}/>*/}
				<AppBar className={"bg-transparent"} elevation={0}>
					<Toolbar>
						<IconButton onClick={() => history.goBack()} edge="start" aria-label="menu">
							<ArrowBack/>
						</IconButton>
						{/*<Typography style={{color: "#FFFFFF"}} variant="h6">*/}
						{/*    Settings*/}
						{/*</Typography>*/}
						{/*<div style={{flex: "1 1 auto"}}/>*/}
						{/*<IconButton*/}
						{/*    edge="start"*/}
						{/*    style={{color: "#FFFFFF"}}*/}
						{/*    aria-label="Search"*/}
						{/*    component={Link}*/}
						{/*    to={"/search"}*/}
						{/*>*/}
						{/*    <Search/>*/}
						{/*</IconButton>*/}
					</Toolbar>
				</AppBar>
				<div className={"text-center"}>
					<ListItemText id="switch-list-label-wifi"
								  primary={userInfo ? userInfo.username : ""}
								  secondary={userInfo ? userInfo.email : ""}/>
				</div>
			</List>
			<List>
				<Divider/>
				<ListItem>
					<ListItemIcon>
						<Brightness4/>
					</ListItemIcon>
					<ListItemText id="switch-list-label-wifi" primary="Dark Mode" secondary={"Enable Dark Theme"}/>
					<ListItemSecondaryAction>
						<Switch
							edge="end"
							onChange={() => {
								setDarkmode(!darkmode);
								handleSwitch("darkmode", !switches["darkmode"]);
							}}
							checked={switches["darkmode"]}
							inputProps={{"aria-labelledby": "switch-list-label-wifi"}}
						/>
					</ListItemSecondaryAction>
				</ListItem>
				<ListItem>
					<ListItemIcon>
						<Cast/>
					</ListItemIcon>
					<ListItemText id="switch-list-label-wifi" primary="Song Casting"
								  secondary={"Remote Play songs on connected devices"}/>
					<ListItemSecondaryAction>
						<Switch
							edge="end"
							onChange={(e) => {
								localStorage.setItem(storageIndex.castEnabled, !switches["casting"]);
								handleSwitch("casting", !switches["casting"]);
							}}
							checked={switches["casting"]}
							inputProps={{"aria-labelledby": "switch-list-label-wifi"}}
						/>
					</ListItemSecondaryAction>
				</ListItem>
				<ListItem>
					<ListItemIcon>
						<Keyboard/>
					</ListItemIcon>
					<ListItemText id="switch-list-label-wifi" primary="On-screen Keyboard"
								  secondary={"On Screen keyboard for TV devices"}/>
					<ListItemSecondaryAction>
						<Switch
							edge="end"
							onChange={(e) => {
								localStorage.setItem(storageIndex.onScreenKeyboard, !switches["keyboard"]);
								handleSwitch("keyboard", !switches["keyboard"]);
							}}
							checked={switches["keyboard"]}
							inputProps={{"aria-labelledby": "switch-list-label-wifi"}}
						/>
					</ListItemSecondaryAction>
				</ListItem>

				<ListItem>
					<ListItemIcon>
						<DataUsage/>
					</ListItemIcon>
					<ListItemText id="switch-list-label-wifi" primary="Lite Mode"
								  secondary={"Cache results to save data"}/>
					<ListItemSecondaryAction>
						<Switch
							edge="end"
							onChange={(e) => {
								localStorage.setItem(storageIndex.litemode, !switches["litemode"]);
								handleSwitch("litemode", !switches["litemode"]);
							}}
							checked={switches["litemode"]}
							inputProps={{"aria-labelledby": "switch-list-label-wifi"}}
						/>
					</ListItemSecondaryAction>
				</ListItem>


				<ListItem button onClick={async () => {
					del(storageIndex.home.saveObject);
					del(storageIndex.home.timeObject);


					del(storageIndex.discover.saveObject);
					del(storageIndex.discover.timeObject);


					del(storageIndex.trendingArtists.saveObject);
					del(storageIndex.trendingArtists.timeObject);

				}}>
					<ListItemIcon>
						<Storage/>
					</ListItemIcon>
					<ListItemText id="switch-list-label-wifi" primary="Clear Cache"
								  secondary={"Delete Cached Data"}/>

				</ListItem>
				<Divider/>

				<ListItem>
					<ListItemText id="switch-list-label-bluetooth" primary="Feedback and Help"
								  secondary={"Send feedback or report a bug"}/>
					<ListItemSecondaryAction>
						<FeedbackButton/>
					</ListItemSecondaryAction>
				</ListItem>
				<ListItem button onClick={() => {
					const config = {
						title: (
							<List className={"p-0 m-0"}>
								<ListItem className={"p-0 m-0"}>
									<ListItemText className={"p-0 m-0"} primary={"Device Cast Id"}
												  secondary={"This Will be used when casting to this device"}/>
								</ListItem>
							</List>
						),
						message: (
							<TextField disabled variant="filled" value={Device.getId()}/>
						) || "Nothing Here!",
					};
					dialog.alert(config);
				}}>
					<ListItemText primary={"Device ID"} secondary={"Device Id When Casting"}/>
					<ListItemSecondaryAction>
						<Cast/>
					</ListItemSecondaryAction>
				</ListItem>
			</List>
		</div>
	);
};

Settings.propTypes = {};

Settings.defaultProps = {};

export default React.memo(Settings);
