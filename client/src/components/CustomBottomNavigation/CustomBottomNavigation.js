import React from "react";
import "./CustomBottomNavigation.css";
import BottomNavigationAction from "@material-ui/core/BottomNavigationAction";
import {Explore, GetApp, Home, TrendingUp} from "@material-ui/icons";
import makeStyles from "@material-ui/core/styles/makeStyles";
import BottomNavigation from "@material-ui/core/BottomNavigation";
import AppBar from "@material-ui/core/AppBar";
import {Link} from "react-router-dom";
import Slide from "@material-ui/core/Slide";
import useScrollTrigger from "@material-ui/core/useScrollTrigger";
import * as PropTypes from "prop-types";
import LinearProgress from "@material-ui/core/LinearProgress";
import {isTvContext, LoadingContext} from "../../Contexts";

const useStyles = makeStyles({
	root: {
		width: "100%",
	},
});
const HideOnScroll = (props) => {
	const {children, window} = props;
	const trigger = useScrollTrigger({target: window ? window() : undefined});
	return (
		<Slide appear={false} direction="up" in={!trigger}>
			{children}
		</Slide>
	);
};
HideOnScroll.propTypes = {
	children: PropTypes.element.isRequired,
	window: PropTypes.func,
};
const CustomBottomNavigation = () => {
	const classes = useStyles();
	const [value, setValue] = React.useState("home");
	const tv = React.useContext(isTvContext);
	const [loading] = React.useContext(LoadingContext);

	return tv ? null : (
		<AppBar color="primary" style={{
			position: "fixed",
			top: "auto",
			bottom: 0,
			width: "100%",
			marginLeft: tv ? "4.5rem" : ""
		}} component={"div"}>
			<div style={{zIndex: "99999"}} hidden={!loading} className={"fixed-top"}>
				<LinearProgress/>
			</div>
			<BottomNavigation value={value} onChange={(event, newValue) => setValue(newValue)} className={classes.root}>
				<BottomNavigationAction style={{textDecoration: "none"}} component={Link} to={"/home"} label="Home"
										value="home" icon={<Home/>}/>
				<BottomNavigationAction style={{textDecoration: "none"}} component={Link} to={"/discover"}
										label="Discover" value="discover"
										icon={<Explore/>}/>
				<BottomNavigationAction style={{textDecoration: "none"}} component={Link} to={"/downloads"}
										label="Downloads" value="downloads"
										icon={<GetApp/>}/>
				<BottomNavigationAction style={{textDecoration: "none"}} component={Link} to={"/trending"}
										label="Trending" value="trending"
										icon={<TrendingUp/>}/>
			</BottomNavigation>
		</AppBar>
	);
};

CustomBottomNavigation.propTypes = {};

CustomBottomNavigation.defaultProps = {};

export default React.memo(CustomBottomNavigation);
