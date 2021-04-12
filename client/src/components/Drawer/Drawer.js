import React from "react";
import PropTypes from "prop-types";
import {
	Avatar,
	Divider,
	Drawer,
	List,
	ListItem,
	ListItemAvatar,
	ListItemIcon,
	ListItemText,
	makeStyles,
	SwipeableDrawer,
	Typography
} from "@material-ui/core";
import {AccountCircle, Favorite, GetApp, History, Home, Settings} from "@material-ui/icons";
import {Link} from "react-router-dom";
import {storageIndex} from "../../functions/Helper/storageIndex";
import {FocusNode} from "@please/lrud";
import {DrawerContext, isTvContext} from "../../Contexts";
import {get} from "idb-keyval";

const drawerWidth = 340;
const useStyles = makeStyles((theme) => ({
	root: {
		display: "flex",
	},
	drawer: {
		[theme.breakpoints.up("xs")]: {
			width: drawerWidth + 50,
			flexShrink: 0,
		},
		[theme.breakpoints.up("md")]: {
			width: drawerWidth + 100,
			flexShrink: 0,
		},
		[theme.breakpoints.up("xl")]: {
			width: drawerWidth,
			flexShrink: 0,
		},
	},
	appBar: {
		[theme.breakpoints.up("xl")]: {
			width: `calc(100% - ${drawerWidth}px)`,
			marginLeft: drawerWidth,
		},
	},
	menuButton: {
		marginRight: theme.spacing(2),
		[theme.breakpoints.up("sm")]: {
			display: "none",
		},
	},
	// necessary for content to be below app bar
	toolbar: theme.mixins.toolbar,
	drawerPaper: {
		width: drawerWidth,
	},
	content: {
		transition: theme.transitions.create("margin", {
			easing: theme.transitions.easing.sharp,
			duration: theme.transitions.duration.leavingScreen,
		}),
	},
	logoText: {
		paddingRight: theme.spacing(1)
	},
	logoContainer: {
		alignItems: "baseline",
		fontSize: theme.spacing(2.25),
		marginLeft: theme.spacing(2.5),
		marginBottom: theme.spacing(2),
		marginTop: theme.spacing(2),
	},
	logoImage: {
		height: "auto",
		width: theme.spacing(3),
	},
	marginRight: {
		marginLeft: drawerWidth
	},
	smallAvatar: {
		width: theme.spacing(3),
		height: theme.spacing(3),
	},
	drawerClose: {
		transition: theme.transitions.create("width", {
			easing: theme.transitions.easing.sharp,
			duration: theme.transitions.duration.leavingScreen,
		}),
		overflowX: "hidden",
		width: theme.spacing(7) + 1,
		[theme.breakpoints.up("sm")]: {
			width: theme.spacing(9) + 1,
		},
	},
}));
//console.log(window);

const DrawerComponent = ({children}) => {

	const classes = useStyles();
	const [open, setOpen] = React.useContext(DrawerContext);
	const tv = React.useContext(isTvContext);
	const handleDrawerToggle = () => setOpen(!open);
	const [userInfo, setUserInfo] = React.useState(null);
	React.useEffect(() => {
		get(storageIndex.cookies.UserData).then(setUserInfo);
	}, []);

	// const userData = localStorage.getItem(storageIndex.userData) ? JSON.parse(atob(localStorage.getItem(storageIndex.userData))) : {};

	// const container = window !== undefined ? () => window().document.body : undefined;
	return (
		<div>
			{tv ? <FocusNode className={tv ? "" : "d-none"} onFocused={() => setOpen(!open)}>
				<Drawer
					variant="permanent"
					elevation={1}
					ModalProps={{keepMounted: true}}
					onMouseOver={() => setOpen(!open)}
					classes={{paper: classes.drawerClose}}>
					<React.Fragment>
						<List className={classes.root}>
							<ListItem>
								<ListItemAvatar>
									<Avatar src={userInfo ? userInfo["account_image"] : ""}
											alt={userInfo ? userInfo.username : ""}/>
								</ListItemAvatar>
								<ListItemText className={"text-truncate"} primary={userInfo ? userInfo.username : ""}
											  secondary={userInfo ? userInfo.email : ""}/>
							</ListItem>
						</List>
						<div className={"classes.toolbar"}/>
						<Divider/>
						<List onClick={handleDrawerToggle}>
							<ListItem>
								<ListItemIcon className={"my-2 ml-2"}><Home/></ListItemIcon>
							</ListItem>
							<ListItem>
								<ListItemIcon className={"my-2 ml-2"}><GetApp/></ListItemIcon>
							</ListItem>
							<ListItem>
								<ListItemIcon className={"my-2 ml-2"}><History/></ListItemIcon>
							</ListItem>
							<ListItem>
								<ListItemIcon className={"my-2 ml-2"}><Favorite/></ListItemIcon>
							</ListItem>
							<Divider/>
							<ListItem>
								<ListItemIcon className={"my-2 ml-2"}><Settings/></ListItemIcon>
							</ListItem>
							<ListItem>
								<ListItemIcon className={"my-2 ml-2"}><AccountCircle/></ListItemIcon>
							</ListItem>
						</List>
					</React.Fragment>
				</Drawer>
			</FocusNode> : null}
			<SwipeableDrawer
				anchor={"left"}
				open={open}
				disableSwipeToOpen={tv}
				onClose={handleDrawerToggle}
				onOpen={handleDrawerToggle}
				ModalProps={{keepMounted: true}}>
				<React.Fragment>
					<List className={classes.root}>
						<ListItem>
							<ListItemAvatar>
								<Avatar src={userInfo ? userInfo["account_image"] : ""}
										alt={userInfo ? userInfo.username : ""}/>
							</ListItemAvatar>
							<ListItemText className={"text-truncate"}>
								{userInfo ? userInfo.username : ""}
							</ListItemText>
						</ListItem>
					</List>
					<div className={"classes.toolbar"}/>
					<Divider/>
					<List onClick={handleDrawerToggle}>
						<ListItem button component={Link} to={"/home"}>
							<ListItemIcon><Home/></ListItemIcon>
							<ListItemText primary={"Home"}/>
						</ListItem>
						<ListItem button component={Link} to={"/downloads"}>
							<ListItemIcon><GetApp/></ListItemIcon>
							<ListItemText primary={"Downloads"}/>
						</ListItem>
						<ListItem button component={Link} to={"/history"}>
							<ListItemIcon><History/></ListItemIcon>
							<ListItemText primary={"History"}/>
						</ListItem>
						<ListItem button component={Link} to={"/liked"}>
							<ListItemIcon><Favorite/></ListItemIcon>
							<ListItemText primary={"Liked"}/>
						</ListItem>
						<Divider/>
						<ListItem button component={Link} to={"/settings"}>
							<ListItemIcon><Settings/></ListItemIcon>
							<ListItemText primary={"Settings"}/>
						</ListItem>
						<ListItem button>
							<ListItemIcon><AccountCircle/></ListItemIcon>
							<ListItemText primary={"Account"}/>
						</ListItem>
					</List>
					<List className={tv ? "d-none" : ""}>
						<Divider/>
						<ListItem button>
							<Typography muted small>
								<div className={"text-muted small"}>&copy; {new Date().getFullYear()} Kabeer's Network
								</div>
							</Typography>
						</ListItem>
					</List>
				</React.Fragment>
			</SwipeableDrawer>
			<main className={`MainDrawerContainer ${classes.content}`}
				  style={{marginLeft: tv ? "4.5rem" : ""}}>
				<React.Fragment>
					{children}
				</React.Fragment>
			</main>
		</div>
	);
};
DrawerComponent.propTypes = {
	children: PropTypes.element.isRequired,
	/**
	 * Injected by the documentation to work in an iframe.
	 * You won't need it on your project.
	 */
	window: PropTypes.func,
};
export default React.memo(DrawerComponent);
