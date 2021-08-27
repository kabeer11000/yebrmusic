import React from "react";
import "./CustomAppBar.css";
import AppBar from "@material-ui/core/AppBar";
import Toolbar from "@material-ui/core/Toolbar";
import IconButton from "@material-ui/core/IconButton";
import {ArrowBack, Menu, Search} from "@material-ui/icons";
import Typography from "@material-ui/core/Typography";
import {Link, useHistory} from "react-router-dom";
import {makeStyles} from "@material-ui/core/styles";
import HideOnScroll from "../HideOnScroll/HideOnScroll";
import Avatar from "@material-ui/core/Avatar";
import Button from "@material-ui/core/Button";
import LinearProgress from "@material-ui/core/LinearProgress";
import {AccountChooserContext, AccountContext, DrawerContext, isTvContext, LoadingContext} from "../../Contexts";
import Paper from "@material-ui/core/Paper";
import InputBase from "@material-ui/core/InputBase";
import {Divider} from "@material-ui/core";

const useStyles = makeStyles((theme) => ({
	appBar: {
		width: "calc(100% - 4.5rem)",
		marginLeft: "4.5rem",
	},
	root: {
		padding: "2px 4px",
		display: "flex",
		alignItems: "center",
		width: "100%",
	},
	input: {
		marginLeft: theme.spacing(1),
		flex: 1,
	},
	iconButton: {
		padding: 10,
	},
	divider: {
		height: 28,
		margin: 4,
	},
}));
const CustomAppBar = () => {
	const [drawer, setDrawer] = React.useContext(DrawerContext);
	const tv = React.useContext(isTvContext);
	const classes = useStyles();
	const [loading] = React.useContext(LoadingContext);
	const history = useHistory();
	const {account: userInfo} = React.useContext(AccountContext);
	const [open, setOpen] = React.useContext(AccountChooserContext).dialog;

	return tv ?
		(
			<React.Fragment>
				<div style={{zIndex: "99999"}} hidden={!loading} className={"fixed-top"}>
					<LinearProgress/>
				</div>
				<AppBar position="sticky" className={"bg-transparent position-relative"} elevation={0}>
					<Toolbar style={{width: "100%", display: "inline-flex", justifyContent: "space-between"}}>
						<div className={"d-inline-flex"}>
							<Avatar src={"./assets/icons/smallTvIcon.svg"}/>
							<Typography color={"textPrimary"} variant={"button"} className={"mt-2"}>
								YEBR
							</Typography>
						</div>
						<div style={{width: "100%", display: "inline-flex", justifyContent: "center"}}>
							<Button component={Link} to={"/home"}>HOME</Button>
							<Button component={Link} to={"/discover"}>DISCOVER</Button>
							{/*<Button component={Link} to={"/history"}>HISTORY</Button>*/}
							<Button component={Link} to={"/downloads"}>DOWNLOADS</Button>
							<Button component={Link} to={"/artists"}>ARTISTS</Button>
						</div>
						<div className={"d-flex"}>
							<IconButton component={Link} to={"/search"}>
								<Search/>
							</IconButton>
							{/*<Divider orientation={"vertical"}/>*/}
							{/*<IconButton>*/}
							{/*	<Avatar src={userInfo ? userInfo.account_image : ""}/>*/}
							{/*</IconButton>*/}
						</div>
					</Toolbar>
				</AppBar>
			</React.Fragment>
		) : (
			<HideOnScroll>
				<AppBar className={"bg-transparent px-3 py-3"} elevation={0}>
					<Paper component="form" className={classes.root}>
						<IconButton onClick={() => setDrawer(!drawer)} className={classes.iconButton} aria-label="menu">
							{drawer ? <ArrowBack/> : <Menu/>}
						</IconButton>
						<InputBase
							readOnly
							onClick={() => history.push("/search")}
							// component={Link} to={"/search"}
							className={`text-truncate ${classes.input}`}
							placeholder="Search Yebr"
							inputProps={{"aria-label": "search yebr music"}}
						/>
						<IconButton className={classes.iconButton} aria-label="search"
									onClick={() => history.push("/search")}>
							<Search/>
						</IconButton>
						<Divider orientation={"vertical"} className={classes.divider}/>
						{userInfo ? (<IconButton onClick={() => setOpen(!open)} className={classes.iconButton}>
							<Avatar src={userInfo ? userInfo.account_image : ""}
									style={{width: "1.7rem", height: "1.7rem"}}/>
						</IconButton>) : (<Button onClick={() => window.location.href = "LOGIN" + "?prompt=password"}>Sign
							In</Button>)}
						{/*<Divider className={classes.divider} orientation="vertical" />*/}
						{/*<IconButton component={Link} to={"/settings"} color="primary" className={classes.iconButton} aria-label="directions">*/}
						{/*	<Mic />*/}
						{/*</IconButton>*/}
					</Paper>
				</AppBar>
			</HideOnScroll>
		);
};
/*
			<div className={"position-fixed w-100"} style={{marginTop: '-5rem', zIndex: '55'}}>

 */
CustomAppBar.propTypes = {};

CustomAppBar.defaultProps = {};

export default React.memo(CustomAppBar);
